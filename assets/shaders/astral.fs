#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
  #define PRECISION highp
#else
  #define PRECISION mediump
#endif

extern PRECISION vec2 astral;
extern PRECISION number dissolve;
extern PRECISION number time;
extern PRECISION vec4 texture_details;
extern PRECISION vec2 image_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv);

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords)
{
  vec4 tex = Texel(texture, texture_coords);
  vec2 uv = (((texture_coords) * (image_details)) - texture_details.xy * texture_details.ba) / texture_details.ba;

  // blue tint
  vec3 astralVec = tex.rgb;
  astralVec.r = (tex.r * 0.5) + (tex.g * 0.1) + (tex.g * 0.1);
  astralVec.g = (tex.r * 0.1) + (tex.g * 0.9) + (tex.b * 0.1);
  astralVec.b = (tex.r * 0.1) + (tex.g * 0.1) + (tex.b * 1.1);


  // gray lines
  number factor = mod((uv.y - astral.y*0.07) * 95, 6) / 3;
  if (factor > 1) {
    factor = 2 * (1 - factor) + factor;
  }
  factor = pow(factor, 3) * 0.6;
  vec3 crt = vec3(0.4, 0.4, 0.4);
  astralVec.r = (1 - factor) * astralVec.r + factor * crt.r;
  astralVec.g = (1 - factor) * astralVec.g + factor * crt.g;
  astralVec.b = (1 - factor) * astralVec.b + factor * crt.b;

  // gray lines 2
  number factor2 = mod((uv.y - astral.y*0.1) * 95, 2);
  if (factor2 > 1) {
    factor2 = 2 * (1 - factor2) + factor2;
  }
  factor2 = pow(factor2, 5) * 0.2;
  astralVec.r = (1 - factor2) * astralVec.r + factor2 * crt.r;
  astralVec.g = (1 - factor2) * astralVec.g + factor2 * crt.g;
  astralVec.b = (1 - factor2) * astralVec.b + factor2 * crt.b;

  // darker in the corners
  vec2 uv_temp = uv * 2;
  if (uv_temp.x > 1) {
    uv_temp.x = 2 * (1 - uv_temp.x) + uv_temp.x;
  }
  if (uv_temp.y > 1) {
    uv_temp.y = 2 * (1 - uv_temp.y) + uv_temp.y;
  }
  number factor3 = min(uv_temp.x * uv_temp.y * 3, 1.1);

  vec3 darken = vec3(0.25, 0.25, 0.25);
  astralVec.r = factor3 * astralVec.r + (1 - factor3) * darken.r;
  astralVec.g = factor3 * astralVec.g + (1 - factor3) * darken.g;
  astralVec.b = factor3 * astralVec.b + (1 - factor3) * darken.b;

  tex = vec4(astralVec, tex.a);

/*
  if (uv.x > 2. * uv.x) {
    uv = astral;
  }
*/

  return dissolve_mask(tex * colour, texture_coords, uv);
}

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, shadow ? tex.a*0.3: tex.a);
    }

    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01; //Adjusting 0.0-1.0 to fall to -0.1 - 1.1 scale so the mask does not pause at extreme values

	float t = time * 10.0 + 2003.;
	vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);
	
	vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t / 143.6340), cos(-t / 99.4324));
	vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t / 53.1532),  cos( t / 61.4532));
	vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t / 87.53218), sin(-t / 49.0000));

    float field = (1.+ (
        cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) +
        cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92) ))/2.;
    vec2 borders = vec2(0.2, 0.8);

    float res = (.5 + .5* cos( (adjusted_dissolve) / 82.612 + ( field + -.5 ) *3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(5. + 5.*dissolve) : 0.)*(dissolve);

    if (tex.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            tex.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a*0.3: tex.a) : .0);
}

// for transforming the card while your mouse is on it
extern PRECISION vec2 mouse_screen_pos;
extern PRECISION float hovering;
extern PRECISION float screen_scale;

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    if (hovering <= 0.){
        return transform_projection * vertex_position;
    }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03 - 0.3*max(0., 0.3-mid_dist))
                *hovering*(length(mouse_offset)*length(mouse_offset))/(2. -mid_dist);

    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif
