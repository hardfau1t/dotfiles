/*
Copyright 2019 @foostan
Copyright 2020 Drashna Jaelre <@drashna>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include QMK_KEYBOARD_H

// clang-format off
const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[0] = LAYOUT_split_3x6_3(
            KC_GRV,             KC_QUOT,    KC_COMM,    KC_DOT,     KC_P,       KC_Y,       /*------*/      KC_F,       KC_G,       KC_C,       KC_R,       KC_L,       KC_BSPC,
            /* `                    '           ,           .           p           y                           f           g           c           r           l           <BS> */
            KC_TAB,             KC_A,       KC_O,       KC_E,       KC_U,       KC_I,       /*------*/      KC_D,       KC_H,       KC_T,       KC_N,       KC_S,       KC_MINS,
            /* <TAB>                a           o           e           u           i                           d           h           t           n           s           -   */
            KC_LSFT,            KC_SCLN,    KC_Q,       KC_J,       KC_K,       KC_X,       /*------*/      KC_B,       KC_M,       KC_W,       KC_V,       KC_Z,       KC_RSFT,
            /* <S>                  ;           q           j           k           x                           b           m           w           v           z           <S> */
                                    KC_LCTL,    KC_SPC,     LT(2, KC_ESC),                  /*------*/              LT(1,KC_SLSH),  LGUI_T(KC_ENT),  LALT_T(KC_BSLS)),
            /*                          <C>         <Space>     <esc>                                                   /               <Ent>           \ */

            /******************************************************************************************************************************************************************/

	[1] = LAYOUT_split_3x6_3(
            KC_TILD,            KC_1,       KC_2,       KC_3,       KC_4,       KC_5,       /*------*/      KC_F7,      KC_F8,      KC_F9,      KC_F10,     KC_F11,     KC_F12,
            /* ~                1           2           3           4           5                           F7          F8          F9          F10         F11         F12 */
            KC_TAB,             KC_EXLM,    KC_AT,      KC_HASH,    KC_DLR,     KC_PERC,    /*------*/      KC_VOLD,    KC_MUTE,    KC_VOLU,    KC_BRID,    KC_BRIU,    KC_F13,
            /* <Tab>            !           @           #           $           %                           v-          mute        v+          b-          b+          F13 */
            KC_LSFT,            KC_PIPE,    KC_LCBR,    KC_RCBR,    KC_PLUS,    KC_EQL,     /*------*/      KC_MPRV,    KC_MPLY,    KC_MNXT,    KC_PSTE,    KC_UNDO,    KC_FIND,
            /* <S>              |           {           }           +           =                           M_prev      M_play      M_next      <paste>     <undo>      <find>  */
                                    KC_LCTL,    KC_SPC,    MO(3),                           /*------*/           MO(1), KC_TRNS, KC_RALT),

            /******************************************************************************************************************************************************************/

	[2] = LAYOUT_split_3x6_3(
            KC_F1,          KC_F2,          KC_F3,      KC_F4,      KC_F5,      KC_F6,      /*------*/      KC_6,       KC_7,       KC_8,       KC_9,       KC_0,       KC_DELETE,
            /* F1           F2              F3          F4          F5          F6                          6           7           8           9           0           <delete> */
            KC_TRNS,        KC_HOME,        KC_LEFT,    KC_UP,      KC_RIGHT,   KC_END,     /*------*/      KC_CIRC,    KC_AMPR,    KC_ASTR,    KC_LPRN,    KC_RPRN,    KC_UNDS,
            /* <none>       <home>          <left>      <up>        <right>     <end>                       ^           &           *           (           )           _       */
            KC_WAKE,        KC_CUT,         KC_COPY,    KC_DOWN,    KC_WBAK,    KC_WFWD,    /*------*/      KC_TRNS,    KC_TRNS,    KC_QUES,    KC_LBRC,    KC_RBRC,    KC_RSFT,
            /* <wake?>      <cut>           <copy>      <down>      <browser-b> <browser-f>                 transparent transparent ?           [           ]           <S> */
                                    KC_LCTL,    KC_SPC,    MO(2),                           /*------*/              MO(3),          MOD_RGUI,         KC_RALT),

            /******************************************************************************************************************************************************************/

	[3] = LAYOUT_split_3x6_3(
            KC_TILD,            KC_1,       KC_2,       KC_3,       KC_4,       KC_5,       /*------*/      KC_6,       KC_7,       KC_8,       KC_9,       KC_0,       KC_DELETE,
            KC_F1,              KC_F2,      KC_F3,      KC_F4,      KC_F5,      KC_F6,      /*------*/      KC_F7,      KC_F8,      KC_F9,      KC_F10,     KC_F11,     KC_F12,
            LSFT_T(KC_ESC),     KC_TRNS,    KC_TRNS,    OSL(6),     OSL(5),     TG(4),      /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_RSFT,
                                    KC_LCTL,    KC_SPC,      MO(2),                         /*------*/              MO(1),        MOD_RGUI,        TG(3)),

            /****************************************************************************** numpad ****************************************************************************/

	[4] = LAYOUT_split_3x6_3(
            KC_ASTR,            KC_SLSH,    KC_7,       KC_8,       KC_9,       KC_0,       /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_BSPC,
            KC_PLUS,            KC_MINS,    KC_4,       KC_5,       KC_6,       KC_DOT,     /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,
            LSFT_T(KC_ESC),     KC_TRNS,    KC_1,       KC_2,       KC_3,       KC_ENT,     /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,
                                    KC_LCTL,    KC_SPC,      KC_ESC,                        /*------*/              TG(4),        MOD_RGUI,     KC_RALT),

            /****************************************************************************** ctrl + numpad *********************************************************************/

	[5] = LAYOUT_split_3x6_3(
            KC_TRNS,            KC_TRNS,    LCTL(KC_7), LCTL(KC_8), LCTL(KC_9), KC_TRNS,    /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_BSPC,
            KC_TRNS,            KC_TRNS,    LCTL(KC_4), LCTL(KC_5), LCTL(KC_6), KC_TRNS,    /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,
            LSFT_T(KC_ESC),     KC_TRNS,    LCTL(KC_1), LCTL(KC_2), LCTL(KC_3), KC_TRNS,    /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,
                                    KC_LCTL,    KC_SPC,      KC_ESC,                        /*------*/              TG(5),        MOD_RGUI,     KC_RALT),

            /****************************************************************************** alt + numpad **********************************************************************/

	[6] = LAYOUT_split_3x6_3(
            KC_TRNS,            KC_TRNS,    LALT(KC_7), LALT(KC_8), LALT(KC_9), KC_TRNS,    /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_BSPC,
            KC_TRNS,            KC_TRNS,    LALT(KC_4), LALT(KC_5), LALT(KC_6), KC_TRNS,    /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,
            LSFT_T(KC_ESC),     KC_TRNS,    LALT(KC_1), LALT(KC_2), LALT(KC_3), KC_TRNS,    /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,
                                    KC_LCTL,    KC_SPC,      KC_ESC,                        /*------*/              TG(6),        MOD_RGUI,     KC_RALT),

};
// clang-format on

#ifdef OLED_ENABLE
oled_rotation_t oled_init_user(oled_rotation_t rotation) {
    if (!is_keyboard_master()) {
        return OLED_ROTATION_180; // flips the display 180 degrees if offhand
    }
    return rotation;
}

#define L_BASE 0
#define L_LOWER 2
#define L_RAISE 4
#define L_ADJUST 8

// render current rgb matrix mode
#ifdef RGB_MATRIX_ENABLE
void oled_redender_current_mode(void) {
    if (rgb_matrix_is_enabled()) {
        oled_write("\nRGB mode: ", false);
        uint8_t current_mode = rgb_matrix_get_mode();
        oled_write(get_u8_str(current_mode, ' '), false);
    } else {
        oled_write("\nRGB disabled", false);
    }
}
#endif

void oled_render_layer_state(void) {
    oled_write_P(PSTR("Layers: "), false);
    if (layer_state == 0) {
        oled_write_char('0', false);
    } else {
        uint32_t tmp_layer_state = layer_state;
        uint8_t layer_id = 0;
        while (tmp_layer_state) {
            if (tmp_layer_state & 1) {
                // write the layer id to screen
                const char *layer_id_str = get_u8_str(layer_id, ' ');
                layer_id_str++; // because there can be only 2 digits in layer so no point in having 3 digits space in
                                // string
                if (layer_id_str[0] == ' ') {
                    // if the character is space then ignore, since the padding adds the space and comma
                    layer_id_str++;
                }
                oled_write(layer_id_str, false);
                // if there are still characters then put comma
                if (tmp_layer_state >> 1) {
                    oled_write_P(PSTR(", "), false);
                }
            }
            layer_id++;
            tmp_layer_state >>= 1;
        }
    }
    oled_advance_page(true);
}

#define KEY_LOG_STR_LENGTH 24

char keylog_str[KEY_LOG_STR_LENGTH] = {};

const char code_to_name[60] = {' ', ' ', ' ', ' ', 'a',  'b', 'c', 'd',  'e', 'f', 'g', 'h', 'i', 'j', 'k',
                               'l', 'm', 'n', 'o', 'p',  'q', 'r', 's',  't', 'u', 'v', 'w', 'x', 'y', 'z',
                               '1', '2', '3', '4', '5',  '6', '7', '8',  '9', '0', 'R', 'E', 'B', 'T', '_',
                               '-', '=', '[', ']', '\\', '#', ';', '\'', '`', ',', '.', '/', ' ', ' ', ' '};

void set_keylog(uint16_t keycode, keyrecord_t *record) {
    char name = ' ';
    if ((keycode >= QK_MOD_TAP && keycode <= QK_MOD_TAP_MAX) ||
        (keycode >= QK_LAYER_TAP && keycode <= QK_LAYER_TAP_MAX)) {
        keycode = keycode & 0xFF;
    }
    if (keycode < 60) {
        name = code_to_name[keycode];
    }

    // update keylog
    // snprintf(keylog_str, sizeof(keylog_str), "%dx%d, k%2d : %c",
    //          record->event.key.row, record->event.key.col,
    //          keycode, name);
    // below code is equivalent of above call ( to save flash size)

    int index = 0;
    const char *event_row =
        get_u8_str(record->event.key.row,
                   ' '); // note: this has to be written immediately, since the buffer returned by this is static buffer
    for (int i = 0; i < 3; i++) {
        if (event_row[i] != ' ') {
            keylog_str[index++] = event_row[i];
        }
    }

    keylog_str[index++] = 'x';

    const char *event_col = get_u8_str(record->event.key.col, ' ');
    for (int i = 0; i < 3; i++) {
        if (event_col[i] != ' ') {
            keylog_str[index++] = event_col[i];
        }
    }
    keylog_str[index++] = ',';
    keylog_str[index++] = ' ';
    keylog_str[index++] = 'k';

    const char *keycode_str = get_u8_str(keycode, ' ');
    for (int i = 0; i < 3; i++) {
        if (keycode_str[i] != ' ') {
            keylog_str[index++] = keycode_str[i];
        }
    }
    keylog_str[index++] = ' ';
    keylog_str[index++] = ':';
    keylog_str[index++] = ' ';
    keylog_str[index++] = name;

    // put a space at the end
    keylog_str[index] = '\0';
}

void oled_render_keylog(void) {
    oled_write(keylog_str, false);
    oled_advance_page(true);
}

void render_bootmagic_status(bool status) {
    /* Show Ctrl-Gui Swap options */
    static const char PROGMEM logo[][2][3] = {
        {{0x97, 0x98, 0}, {0xb7, 0xb8, 0}},
        {{0x95, 0x96, 0}, {0xb5, 0xb6, 0}},
    };
    if (status) {
        oled_write_ln_P(logo[0][0], false);
        oled_write_ln_P(logo[0][1], false);
    } else {
        oled_write_ln_P(logo[1][0], false);
        oled_write_ln_P(logo[1][1], false);
    }
}

static void render_logo(void) {
    static const char PROGMEM raw_logo[] = {
        255, 255, 63,  15,  7,   7,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,
        3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,
        3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,
        3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,
        3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,
        3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,   7,   7,   15,  63,  255, 255, 255, 255, 0,   0,
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   192, 254, 255, 14,  0,   128, 128, 128, 128, 0,   0,
        0,   0,   0,   128, 128, 128, 128, 128, 0,   128, 128, 0,   0,   128, 128, 0,   0,   128, 128, 128, 128, 128,
        128, 0,   0,   0,   0,   128, 128, 128, 128, 128, 224, 254, 255, 6,   0,   128, 128, 128, 240, 248, 188, 142,
        134, 134, 6,   0,   0,   128, 128, 128, 128, 128, 128, 128, 128, 0,   128, 128, 128, 0,   0,   0,   0,   0,
        128, 128, 0,   0,   0,   0,   6,   230, 255, 255, 15,  0,   0,   0,   190, 255, 247, 227, 243, 63,  31,  15,
        0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   255, 255, 255, 255, 0,   0,   0,   0,   0,   0,
        0,   0,   0,   0,   0,   0,   248, 255, 63,  15,  7,   3,   3,   1,   255, 255, 127, 24,  126, 255, 231, 195,
        195, 193, 225, 249, 255, 255, 3,   224, 255, 255, 15,  7,   7,   3,   3,   1,   1,   1,   1,   124, 254, 255,
        199, 195, 225, 225, 113, 253, 255, 63,  0,   0,   1,   1,   241, 255, 127, 3,   1,   1,   1,   60,  126, 255,
        195, 195, 193, 193, 225, 253, 255, 15,  1,   126, 255, 239, 193, 224, 224, 112, 240, 255, 255, 3,   0,   0,
        0,   0,   252, 255, 63,  1,   0,   60,  126, 255, 199, 195, 193, 195, 255, 127, 126, 0,   0,   0,   0,   0,
        0,   0,   0,   0,   0,   0,   0,   2,   255, 255,
    };
    oled_write_raw_P(raw_logo, sizeof(raw_logo));
}

bool oled_task_user(void) {
    if (is_keyboard_master()) {
        oled_render_layer_state();
        oled_render_keylog();
#ifdef RGB_MATRIX_ENABLE
        oled_redender_current_mode();
#endif
    } else {
        render_logo();
    }
    return false;
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    if (record->event.pressed) {
        set_keylog(keycode, record);
    }
    return true;
}
#endif // OLED_ENABLE
