// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)

#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying
#define COMPAT_ATTRIBUTE attribute
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec2 _resize_magnification_scale;
COMPAT_VARYING     vec2 _src_tex_uv_wrap;
COMPAT_VARYING     vec4 _position1;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec4 _position1;
    vec2 _src_tex_uv_wrap;
    vec2 _resize_magnification_scale;
};
out_vertex _ret_0;
float _TMP14;
float _TMP22;
float _TMP21;
float _TMP20;
float _TMP19;
vec2 _TMP23;
float _TMP17;
float _TMP15;
float _TMP16;
input_dummy _IN1;
float _TMP140;
float _TMP146;
float _TMP152;
float _TMP158;
vec4 _r0237;
vec2 _TMP238;
float _desired_tile_size_x0239;
float _temp_tile_size_x0239;
vec2 _max_tile_size0239;
vec2 _reclamped_tile_size0239;
vec2 _final_resized_tile_size0239;
bool _TMP240;
float _b0242;
vec2 _TMP247;
vec2 _x0264;
COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
float _mask_min_allowed_tile_size;
 
uniform mat4 MVPMatrix;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    out_vertex _OUT;
    float _viewport_y;
    vec2 _estimated_viewport_size1;
    vec2 _estimated_mask_resize_output_dummy_size1;
    vec2 _pass_output_dummy_tile_size;
    vec2 _output_dummy_tiles_this_pass;
    vec2 _output_dummy_video_uv;
    vec2 _tile_uv_wrap;
    _TMP16 = min(2.00000000E+00, 0.00000000E+00);
    _TMP140 = max(0.00000000E+00, _TMP16);
    _TMP16 = min(1.00000000E+00, 0.00000000E+00);
    _TMP146 = max(0.00000000E+00, _TMP16);
    _TMP16 = min(1.80000000E+01, 3.00000000E+00);
    _TMP152 = max(1.00000000E+00, _TMP16);
    _TMP16 = min(1.92000000E+03, 4.80000000E+02);
    _TMP158 = max(3.42000000E+02, _TMP16);
    _TMP15 = floor(-1.60000000E+01);
    _mask_min_allowed_tile_size = -_TMP15;
    _r0237 = VertexCoord.x*MVPMatrix[0];
    _r0237 = _r0237 + VertexCoord.y*MVPMatrix[1];
    _r0237 = _r0237 + VertexCoord.z*MVPMatrix[2];
    _r0237 = _r0237 + VertexCoord.w*MVPMatrix[3];
    _viewport_y = OutputSize.y/6.25000000E-02;
    _estimated_viewport_size1 = vec2(_viewport_y*1.31306994E+00, _viewport_y);
    _estimated_mask_resize_output_dummy_size1 = vec2(OutputSize.y*1.31306994E+00, OutputSize.y);
    _TMP240 = true;
    _b0242 = _estimated_viewport_size1.x/_TMP158;
    _TMP17 = _TMP152 + _TMP146*(_b0242 - _TMP152);
    _desired_tile_size_x0239 = 8.00000000E+00*_TMP17;
    if (_TMP140 > 5.00000000E-01) { 
        _TMP238 = vec2(_desired_tile_size_x0239, _desired_tile_size_x0239);
        _TMP240 = false;
    } 
    if (_TMP240) { 
        _temp_tile_size_x0239 = min(_desired_tile_size_x0239, 6.40000000E+01);
        _max_tile_size0239 = _estimated_mask_resize_output_dummy_size1/2.00000000E+00;
        _TMP23 = min(_max_tile_size0239, vec2(_temp_tile_size_x0239, _temp_tile_size_x0239));
        _TMP247 = max(vec2(_mask_min_allowed_tile_size, _mask_min_allowed_tile_size), _TMP23);
        _TMP19 = min(_TMP247.x, _TMP247.y);
        _TMP20 = min(_TMP247.y, _TMP247.y);
        _reclamped_tile_size0239 = vec2(_TMP19, _TMP20);
        _TMP21 = abs(0.00000000E+00);
        _TMP22 = max(_TMP21, 1.52587891E-05);
        _x0264 = _reclamped_tile_size0239 + vec2(_TMP22, _TMP22);
        _final_resized_tile_size0239 = floor(_x0264);
        _TMP238 = _final_resized_tile_size0239;
    } 
    _TMP14 = min(6.40000000E+01, OutputSize.x);
    _pass_output_dummy_tile_size = vec2(_TMP14, _TMP238.y);
    _output_dummy_tiles_this_pass = OutputSize/_pass_output_dummy_tile_size;
    _output_dummy_video_uv = (TexCoord.xy*TextureSize)/InputSize;
    _tile_uv_wrap = _output_dummy_video_uv*_output_dummy_tiles_this_pass;
    _OUT._resize_magnification_scale = _pass_output_dummy_tile_size/vec2( 6.40000000E+01, 6.40000000E+01);
    _ret_0._position1 = _r0237;
    _ret_0._src_tex_uv_wrap = _tile_uv_wrap;
    _ret_0._resize_magnification_scale = _OUT._resize_magnification_scale;
    gl_Position = _r0237;
    TEX0.xy = _tile_uv_wrap;
    TEX1.xy = _OUT._resize_magnification_scale;
    return;
    TEX0.xy = _ret_0._src_tex_uv_wrap;
    TEX1.xy = _ret_0._resize_magnification_scale;
} 
#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec2 _resize_magnification_scale;
COMPAT_VARYING     vec2 _src_tex_uv_wrap1;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size2;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec2 _src_tex_uv_wrap1;
    vec2 _resize_magnification_scale;
};
vec4 _ret_0;
vec4 _TMP22;
vec4 _TMP21;
float _TMP29;
float _TMP28;
float _TMP27;
float _TMP26;
vec4 _TMP20;
vec2 _TMP24;
vec2 _TMP23;
float _TMP12;
float _TMP14;
float _TMP15;
uniform sampler2D mask_grille_texture_small;
uniform sampler2D mask_slot_texture_small;
uniform sampler2D mask_shadow_texture_small;
float _TMP144;
float _TMP150;
float _v0241;
float _x0243;
int _samples0249;
vec4 _weight_sum0249;
vec3 _pixel_color0249;
int _i10249;
vec4 _true_i10249;
vec4 _tile_uv_r10249;
vec4 _dist10249;
vec4 _pi_dist10249;
vec4 _pi_dist_over_lobes10249;
vec4 _weights10249;
vec2 _weight_sum_reduce0249;
vec3 _scalar_weight_sum0249;
vec2 _curr_texel0251;
vec2 _prev_texel0251;
vec2 _first_texel0251;
float _samples0251;
vec2 _first_texel_uv_wrap_2D0251;
vec2 _first_texel_dist_2D0251;
vec2 _coord_negative0251;
vec2 _first_texel_tile_uv_2D0251;
vec2 _tile_v_and_dist0251;
vec2 _x0253;
vec4 _x0257;
vec4 _TMP258;
vec2 _tex_uv0259;
vec4 _TMP262;
vec2 _tex_uv0263;
vec4 _TMP266;
vec2 _tex_uv0267;
vec4 _TMP270;
vec2 _tex_uv0271;
vec4 _a0275;
vec4 _a0297;
int _samples0299;
vec4 _weight_sum0299;
vec3 _pixel_color0299;
int _i10299;
vec4 _true_i10299;
vec4 _tile_uv_r10299;
vec4 _dist10299;
vec4 _pi_dist10299;
vec4 _pi_dist_over_lobes10299;
vec4 _weights10299;
vec2 _weight_sum_reduce0299;
vec3 _scalar_weight_sum0299;
vec2 _curr_texel0301;
vec2 _prev_texel0301;
vec2 _first_texel0301;
float _samples0301;
vec2 _first_texel_uv_wrap_2D0301;
vec2 _first_texel_dist_2D0301;
vec2 _coord_negative0301;
vec2 _first_texel_tile_uv_2D0301;
vec2 _tile_v_and_dist0301;
vec2 _x0303;
vec4 _x0307;
vec4 _TMP308;
vec2 _tex_uv0309;
vec4 _TMP312;
vec2 _tex_uv0313;
vec4 _TMP316;
vec2 _tex_uv0317;
vec4 _TMP320;
vec2 _tex_uv0321;
vec4 _a0325;
vec4 _a0347;
int _samples0349;
vec4 _weight_sum0349;
vec3 _pixel_color0349;
int _i10349;
vec4 _true_i10349;
vec4 _tile_uv_r10349;
vec4 _dist10349;
vec4 _pi_dist10349;
vec4 _pi_dist_over_lobes10349;
vec4 _weights10349;
vec2 _weight_sum_reduce0349;
vec3 _scalar_weight_sum0349;
vec2 _curr_texel0351;
vec2 _prev_texel0351;
vec2 _first_texel0351;
float _samples0351;
vec2 _first_texel_uv_wrap_2D0351;
vec2 _first_texel_dist_2D0351;
vec2 _coord_negative0351;
vec2 _first_texel_tile_uv_2D0351;
vec2 _tile_v_and_dist0351;
vec2 _x0353;
vec4 _x0357;
vec4 _TMP358;
vec2 _tex_uv0359;
vec4 _TMP362;
vec2 _tex_uv0363;
vec4 _TMP366;
vec2 _tex_uv0367;
vec4 _TMP370;
vec2 _tex_uv0371;
vec4 _a0375;
vec4 _a0397;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
float _mask_min_allowed_tile_size;
float _max_sinc_resize_samples_float;
float _max_sinc_resize_samples_m4;
 
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    vec2 _src_tex_uv1;
    vec3 _pixel_color1;
    _TMP15 = min(2.00000000E+00, 1.00000000E+00);
    _TMP144 = max(0.00000000E+00, _TMP15);
    _TMP15 = min(2.00000000E+00, 0.00000000E+00);
    _TMP150 = max(0.00000000E+00, _TMP15);
    _TMP14 = floor(-1.60000000E+01);
    _mask_min_allowed_tile_size = -_TMP14;
    _max_sinc_resize_samples_float = 3.84000000E+02/_mask_min_allowed_tile_size;
    _v0241 = _max_sinc_resize_samples_float*2.50000000E-01;
    _x0243 = -_v0241;
    _TMP14 = floor(_x0243);
    _TMP12 = -_TMP14;
    _max_sinc_resize_samples_m4 = _TMP12*4.00000000E+00;
    if (_TMP150 < 5.00000000E-01 && TEX0.y <= 2.00000000E+00) { 
        _src_tex_uv1 = fract(TEX0.xy);
        if (_TMP144 < 5.00000000E-01) { 
            _samples0249 = int(_max_sinc_resize_samples_m4);
            _samples0251 = float(_samples0249);
            _curr_texel0251 = _src_tex_uv1*vec2( 6.40000000E+01, 6.40000000E+01);
            _x0253 = _curr_texel0251 - vec2( 4.99500006E-01, 4.99500006E-01);
            _TMP23 = floor(_x0253);
            _prev_texel0251 = _TMP23 + vec2( 5.00000000E-01, 5.00000000E-01);
            _first_texel0251 = _prev_texel0251 - vec2(_samples0251/2.00000000E+00 - 1.00000000E+00, _samples0251/2.00000000E+00 - 1.00000000E+00);
            _first_texel_uv_wrap_2D0251 = _first_texel0251*1.56250000E-02;
            _first_texel_dist_2D0251 = _curr_texel0251 - _first_texel0251;
            _coord_negative0251 = vec2(float((_first_texel_uv_wrap_2D0251.x < 0.00000000E+00)), float((_first_texel_uv_wrap_2D0251.y < 0.00000000E+00)));
            _TMP24 = fract(_first_texel_uv_wrap_2D0251);
            _first_texel_tile_uv_2D0251 = _TMP24 + _coord_negative0251;
            _tile_v_and_dist0251 = vec2(_first_texel_tile_uv_2D0251.y, _first_texel_dist_2D0251.y);
            _weight_sum0249 = vec4( 0.00000000E+00, 0.00000000E+00, 0.00000000E+00, 0.00000000E+00);
            _pixel_color0249 = vec3( 0.00000000E+00, 0.00000000E+00, 0.00000000E+00);
            _i10249 = 0;
            for (; _i10249 < _samples0249; _i10249 = _i10249 + 4) { 
                _true_i10249 = vec4(float(_i10249), float(_i10249), float(_i10249), float(_i10249)) + vec4( 0.00000000E+00, 1.00000000E+00, 2.00000000E+00, 3.00000000E+00);
                _x0257 = _tile_v_and_dist0251.xxxx + _true_i10249*1.56250000E-02;
                _tile_uv_r10249 = fract(_x0257);
                _tex_uv0259 = vec2(_src_tex_uv1.x, _tile_uv_r10249.x);
                _TMP258 = COMPAT_TEXTURE(mask_grille_texture_small, _tex_uv0259);
                _tex_uv0263 = vec2(_src_tex_uv1.x, _tile_uv_r10249.y);
                _TMP262 = COMPAT_TEXTURE(mask_grille_texture_small, _tex_uv0263);
                _tex_uv0267 = vec2(_src_tex_uv1.x, _tile_uv_r10249.z);
                _TMP266 = COMPAT_TEXTURE(mask_grille_texture_small, _tex_uv0267);
                _tex_uv0271 = vec2(_src_tex_uv1.x, _tile_uv_r10249.w);
                _TMP270 = COMPAT_TEXTURE(mask_grille_texture_small, _tex_uv0271);
                _a0275 = _tile_v_and_dist0251.yyyy - _true_i10249;
                _TMP20 = abs(_a0275);
                _dist10249 = TEX1.y*_TMP20;
                _pi_dist10249 = 3.14159274E+00*_dist10249;
                _pi_dist_over_lobes10249 = 1.04719758E+00*_dist10249;
                _TMP26 = sin(_pi_dist10249.x);
                _TMP27 = sin(_pi_dist10249.y);
                _TMP28 = sin(_pi_dist10249.z);
                _TMP29 = sin(_pi_dist10249.w);
                _TMP21 = vec4(_TMP26, _TMP27, _TMP28, _TMP29);
                _TMP26 = sin(_pi_dist_over_lobes10249.x);
                _TMP27 = sin(_pi_dist_over_lobes10249.y);
                _TMP28 = sin(_pi_dist_over_lobes10249.z);
                _TMP29 = sin(_pi_dist_over_lobes10249.w);
                _TMP22 = vec4(_TMP26, _TMP27, _TMP28, _TMP29);
                _a0297 = (_TMP21*_TMP22)/(_pi_dist10249*_pi_dist_over_lobes10249);
                _weights10249 = min(_a0297, vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00));
                _pixel_color0249 = _pixel_color0249 + _TMP258.xyz*_weights10249.xxx;
                _pixel_color0249 = _pixel_color0249 + _TMP262.xyz*_weights10249.yyy;
                _pixel_color0249 = _pixel_color0249 + _TMP266.xyz*_weights10249.zzz;
                _pixel_color0249 = _pixel_color0249 + _TMP270.xyz*_weights10249.www;
                _weight_sum0249 = _weight_sum0249 + _weights10249;
            } 
            _weight_sum_reduce0249 = _weight_sum0249.xy + _weight_sum0249.zw;
            _scalar_weight_sum0249 = vec3(_weight_sum_reduce0249.x + _weight_sum_reduce0249.y, _weight_sum_reduce0249.x + _weight_sum_reduce0249.y, _weight_sum_reduce0249.x + _weight_sum_reduce0249.y);
            _pixel_color1 = _pixel_color0249/_scalar_weight_sum0249;
        } else {
            if (_TMP144 < 1.50000000E+00) { 
                _samples0299 = int(_max_sinc_resize_samples_m4);
                _samples0301 = float(_samples0299);
                _curr_texel0301 = _src_tex_uv1*vec2( 6.40000000E+01, 6.40000000E+01);
                _x0303 = _curr_texel0301 - vec2( 4.99500006E-01, 4.99500006E-01);
                _TMP23 = floor(_x0303);
                _prev_texel0301 = _TMP23 + vec2( 5.00000000E-01, 5.00000000E-01);
                _first_texel0301 = _prev_texel0301 - vec2(_samples0301/2.00000000E+00 - 1.00000000E+00, _samples0301/2.00000000E+00 - 1.00000000E+00);
                _first_texel_uv_wrap_2D0301 = _first_texel0301*1.56250000E-02;
                _first_texel_dist_2D0301 = _curr_texel0301 - _first_texel0301;
                _coord_negative0301 = vec2(float((_first_texel_uv_wrap_2D0301.x < 0.00000000E+00)), float((_first_texel_uv_wrap_2D0301.y < 0.00000000E+00)));
                _TMP24 = fract(_first_texel_uv_wrap_2D0301);
                _first_texel_tile_uv_2D0301 = _TMP24 + _coord_negative0301;
                _tile_v_and_dist0301 = vec2(_first_texel_tile_uv_2D0301.y, _first_texel_dist_2D0301.y);
                _weight_sum0299 = vec4( 0.00000000E+00, 0.00000000E+00, 0.00000000E+00, 0.00000000E+00);
                _pixel_color0299 = vec3( 0.00000000E+00, 0.00000000E+00, 0.00000000E+00);
                _i10299 = 0;
                for (; _i10299 < _samples0299; _i10299 = _i10299 + 4) { 
                    _true_i10299 = vec4(float(_i10299), float(_i10299), float(_i10299), float(_i10299)) + vec4( 0.00000000E+00, 1.00000000E+00, 2.00000000E+00, 3.00000000E+00);
                    _x0307 = _tile_v_and_dist0301.xxxx + _true_i10299*1.56250000E-02;
                    _tile_uv_r10299 = fract(_x0307);
                    _tex_uv0309 = vec2(_src_tex_uv1.x, _tile_uv_r10299.x);
                    _TMP308 = COMPAT_TEXTURE(mask_slot_texture_small, _tex_uv0309);
                    _tex_uv0313 = vec2(_src_tex_uv1.x, _tile_uv_r10299.y);
                    _TMP312 = COMPAT_TEXTURE(mask_slot_texture_small, _tex_uv0313);
                    _tex_uv0317 = vec2(_src_tex_uv1.x, _tile_uv_r10299.z);
                    _TMP316 = COMPAT_TEXTURE(mask_slot_texture_small, _tex_uv0317);
                    _tex_uv0321 = vec2(_src_tex_uv1.x, _tile_uv_r10299.w);
                    _TMP320 = COMPAT_TEXTURE(mask_slot_texture_small, _tex_uv0321);
                    _a0325 = _tile_v_and_dist0301.yyyy - _true_i10299;
                    _TMP20 = abs(_a0325);
                    _dist10299 = TEX1.y*_TMP20;
                    _pi_dist10299 = 3.14159274E+00*_dist10299;
                    _pi_dist_over_lobes10299 = 1.04719758E+00*_dist10299;
                    _TMP26 = sin(_pi_dist10299.x);
                    _TMP27 = sin(_pi_dist10299.y);
                    _TMP28 = sin(_pi_dist10299.z);
                    _TMP29 = sin(_pi_dist10299.w);
                    _TMP21 = vec4(_TMP26, _TMP27, _TMP28, _TMP29);
                    _TMP26 = sin(_pi_dist_over_lobes10299.x);
                    _TMP27 = sin(_pi_dist_over_lobes10299.y);
                    _TMP28 = sin(_pi_dist_over_lobes10299.z);
                    _TMP29 = sin(_pi_dist_over_lobes10299.w);
                    _TMP22 = vec4(_TMP26, _TMP27, _TMP28, _TMP29);
                    _a0347 = (_TMP21*_TMP22)/(_pi_dist10299*_pi_dist_over_lobes10299);
                    _weights10299 = min(_a0347, vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00));
                    _pixel_color0299 = _pixel_color0299 + _TMP308.xyz*_weights10299.xxx;
                    _pixel_color0299 = _pixel_color0299 + _TMP312.xyz*_weights10299.yyy;
                    _pixel_color0299 = _pixel_color0299 + _TMP316.xyz*_weights10299.zzz;
                    _pixel_color0299 = _pixel_color0299 + _TMP320.xyz*_weights10299.www;
                    _weight_sum0299 = _weight_sum0299 + _weights10299;
                } 
                _weight_sum_reduce0299 = _weight_sum0299.xy + _weight_sum0299.zw;
                _scalar_weight_sum0299 = vec3(_weight_sum_reduce0299.x + _weight_sum_reduce0299.y, _weight_sum_reduce0299.x + _weight_sum_reduce0299.y, _weight_sum_reduce0299.x + _weight_sum_reduce0299.y);
                _pixel_color1 = _pixel_color0299/_scalar_weight_sum0299;
            } else {
                _samples0349 = int(_max_sinc_resize_samples_m4);
                _samples0351 = float(_samples0349);
                _curr_texel0351 = _src_tex_uv1*vec2( 6.40000000E+01, 6.40000000E+01);
                _x0353 = _curr_texel0351 - vec2( 4.99500006E-01, 4.99500006E-01);
                _TMP23 = floor(_x0353);
                _prev_texel0351 = _TMP23 + vec2( 5.00000000E-01, 5.00000000E-01);
                _first_texel0351 = _prev_texel0351 - vec2(_samples0351/2.00000000E+00 - 1.00000000E+00, _samples0351/2.00000000E+00 - 1.00000000E+00);
                _first_texel_uv_wrap_2D0351 = _first_texel0351*1.56250000E-02;
                _first_texel_dist_2D0351 = _curr_texel0351 - _first_texel0351;
                _coord_negative0351 = vec2(float((_first_texel_uv_wrap_2D0351.x < 0.00000000E+00)), float((_first_texel_uv_wrap_2D0351.y < 0.00000000E+00)));
                _TMP24 = fract(_first_texel_uv_wrap_2D0351);
                _first_texel_tile_uv_2D0351 = _TMP24 + _coord_negative0351;
                _tile_v_and_dist0351 = vec2(_first_texel_tile_uv_2D0351.y, _first_texel_dist_2D0351.y);
                _weight_sum0349 = vec4( 0.00000000E+00, 0.00000000E+00, 0.00000000E+00, 0.00000000E+00);
                _pixel_color0349 = vec3( 0.00000000E+00, 0.00000000E+00, 0.00000000E+00);
                _i10349 = 0;
                for (; _i10349 < _samples0349; _i10349 = _i10349 + 4) { 
                    _true_i10349 = vec4(float(_i10349), float(_i10349), float(_i10349), float(_i10349)) + vec4( 0.00000000E+00, 1.00000000E+00, 2.00000000E+00, 3.00000000E+00);
                    _x0357 = _tile_v_and_dist0351.xxxx + _true_i10349*1.56250000E-02;
                    _tile_uv_r10349 = fract(_x0357);
                    _tex_uv0359 = vec2(_src_tex_uv1.x, _tile_uv_r10349.x);
                    _TMP358 = COMPAT_TEXTURE(mask_shadow_texture_small, _tex_uv0359);
                    _tex_uv0363 = vec2(_src_tex_uv1.x, _tile_uv_r10349.y);
                    _TMP362 = COMPAT_TEXTURE(mask_shadow_texture_small, _tex_uv0363);
                    _tex_uv0367 = vec2(_src_tex_uv1.x, _tile_uv_r10349.z);
                    _TMP366 = COMPAT_TEXTURE(mask_shadow_texture_small, _tex_uv0367);
                    _tex_uv0371 = vec2(_src_tex_uv1.x, _tile_uv_r10349.w);
                    _TMP370 = COMPAT_TEXTURE(mask_shadow_texture_small, _tex_uv0371);
                    _a0375 = _tile_v_and_dist0351.yyyy - _true_i10349;
                    _TMP20 = abs(_a0375);
                    _dist10349 = TEX1.y*_TMP20;
                    _pi_dist10349 = 3.14159274E+00*_dist10349;
                    _pi_dist_over_lobes10349 = 1.04719758E+00*_dist10349;
                    _TMP26 = sin(_pi_dist10349.x);
                    _TMP27 = sin(_pi_dist10349.y);
                    _TMP28 = sin(_pi_dist10349.z);
                    _TMP29 = sin(_pi_dist10349.w);
                    _TMP21 = vec4(_TMP26, _TMP27, _TMP28, _TMP29);
                    _TMP26 = sin(_pi_dist_over_lobes10349.x);
                    _TMP27 = sin(_pi_dist_over_lobes10349.y);
                    _TMP28 = sin(_pi_dist_over_lobes10349.z);
                    _TMP29 = sin(_pi_dist_over_lobes10349.w);
                    _TMP22 = vec4(_TMP26, _TMP27, _TMP28, _TMP29);
                    _a0397 = (_TMP21*_TMP22)/(_pi_dist10349*_pi_dist_over_lobes10349);
                    _weights10349 = min(_a0397, vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00));
                    _pixel_color0349 = _pixel_color0349 + _TMP358.xyz*_weights10349.xxx;
                    _pixel_color0349 = _pixel_color0349 + _TMP362.xyz*_weights10349.yyy;
                    _pixel_color0349 = _pixel_color0349 + _TMP366.xyz*_weights10349.zzz;
                    _pixel_color0349 = _pixel_color0349 + _TMP370.xyz*_weights10349.www;
                    _weight_sum0349 = _weight_sum0349 + _weights10349;
                } 
                _weight_sum_reduce0349 = _weight_sum0349.xy + _weight_sum0349.zw;
                _scalar_weight_sum0349 = vec3(_weight_sum_reduce0349.x + _weight_sum_reduce0349.y, _weight_sum_reduce0349.x + _weight_sum_reduce0349.y, _weight_sum_reduce0349.x + _weight_sum_reduce0349.y);
                _pixel_color1 = _pixel_color0349/_scalar_weight_sum0349;
            } 
        } 
        _ret_0 = vec4(_pixel_color1.x, _pixel_color1.y, _pixel_color1.z, 1.00000000E+00);
        FragColor = _ret_0;
        return;
    } else {
        discard;
    } 
    FragColor = _ret_0;
} 
#endif
