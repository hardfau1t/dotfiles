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
#include <stdio.h>

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
        [0] = LAYOUT_split_3x6_3(
            KC_GRV,             KC_QUOT,    KC_COMM,    KC_DOT,     KC_P,       KC_Y,       /*------*/      KC_F,       KC_G,       KC_C,       KC_R,       KC_L,       KC_BSPC,
            KC_TAB,             KC_A,       KC_O,       KC_E,       KC_U,       KC_I,       /*------*/      KC_D,       KC_H,       KC_T,       KC_N,       KC_S,       KC_MINS,
            KC_LSFT,            KC_SCLN,    KC_Q,       KC_J,       KC_K,       KC_X,       /*------*/      KC_B,       KC_M,       KC_W,       KC_V,       KC_Z,       KC_RSFT,
                                    KC_LCTL,    KC_SPC,     LT(2, KC_ESC),                  /*------*/              LT(1,KC_SLSH),  LGUI_T(KC_ENT),  LALT_T(KC_BSLS)),
    /*******************************************************************************************************************************************************/
        [1] = LAYOUT_split_3x6_3(
            KC_TILD,            KC_1,       KC_2,       KC_3,       KC_4,       KC_5,       /*------*/   KC_F7,      KC_F8,      KC_F9,      KC_F10,     KC_F11,     KC_F12,
            KC_TAB,             KC_EXLM,    KC_AT,      KC_HASH,    KC_DLR,     KC_PERC,    /*------*/   KC_VOLD,    KC_MUTE,    KC_VOLU,    KC_BRID,    KC_BRIU,    KC_F13,
            LSFT_T(KC_BSLS),    KC_PIPE,    KC_LCBR,    KC_RCBR,    KC_PLUS,    KC_EQL,     /*------*/   KC_MPRV,    KC_MPLY,    KC_MNXT,    KC_PSTE,    KC_UNDO,    KC_FIND,
                                    KC_LCTL,    KC_SPC,    MO(3),                           /*------*/           MO(1), KC_TRNS, KC_RALT),
            /*******************************************************************************************************************************************************/
        [2] = LAYOUT_split_3x6_3(
            KC_F1,          KC_F2,      KC_F3,      KC_F4,      KC_F5,      KC_F6,      /*------*/      KC_6,       KC_7,       KC_8,       KC_9,       KC_0,       KC_DELETE,
            KC_NO,        KC_HOME,    KC_LEFT,    KC_UP,      KC_RIGHT,   KC_END,     /*------*/      KC_CIRC,    KC_AMPR,    KC_ASTR,    KC_LPRN,    KC_RPRN,    KC_UNDS,
            KC_WAKE,        KC_CUT,     KC_COPY,    KC_DOWN,    KC_WBAK,    KC_WFWD,    /*------*/      KC_TRNS,    KC_TRNS,    KC_QUES,    KC_LBRC,    KC_RBRC,    RSFT_T(KC_SLSH),
                                    KC_LCTL,    KC_SPC,    MO(2),                      /*------*/              MO(3),          MOD_RGUI,         KC_RALT),

            /*******************************************************************************************************************************************************/

        [3] = LAYOUT_split_3x6_3(
            KC_TILD,            KC_1,       KC_2,       KC_3,       KC_4,       KC_5,       /*------*/      KC_6,       KC_7,       KC_8,       KC_9,       KC_0,       KC_DELETE,
            MI_ON,              MI_C3,      MI_D3,      MI_E3,      MI_F3,      MI_G3,      /*------*/      MI_A3,      MI_B3,      MI_C4,      MI_D4,      MI_E4,      MI_OFF,
            LSFT_T(KC_ESC),     KC_7,       KC_8,       KC_9,       KC_0,       TG(4),      /*------*/      KC_UNDS,    KC_PLUS,    KC_LCBR,    KC_RCBR,    KC_PIPE,    KC_TILD,
                                    KC_LCTL,    KC_SPC,      MO(2),                         /*------*/              MO(1),        MOD_RGUI,        TG(3)),

            /*******************************************************************************************************************************************************/
    [4] = LAYOUT_split_3x6_3(
            TG(4),              UC(0xCAF),  UC(0xCB0),  UC(0xCB2),  UC(0xCB5),  UC(0xCB3),  /*------*/      UC(0xCB6),  UC(0xCB7),  UC(0xCB8),  UC(0xCB9),  OSL(6),     KC_BSPC,
            UC(0xC82),          UC(0xC85),  UC(0xC87),  UC(0xC89),  UC(0xC8E),  UC(0xC92),  /*------*/      UC(0xC9F),  UC(0xCA1),  UC(0xCA4),  UC(0xCA6),  UC(0xCAA),  UC(0xCAC),
            MO(5),              UC(0xC95),  UC(0xC97),  UC(0xC9A),  UC(0xC9C),  UC(0xC90),  /*------*/      UC(0xCAE),  UC(0xCA8),  UC(0xCCD),  UC(0xCA7),  UC(0x000),  MO(5),
                                    KC_LCTL,    KC_SPC,     LT(2, KC_ESC),                  /*------*/              LT(1,KC_SLSH),  LGUI_T(KC_ENT),  LALT_T(KC_BSLS)),
    [5] = LAYOUT_split_3x6_3(
            TG(4),              UC(0xCE7),  UC(0xCE8),  UC(0xCE9),  UC(0xCEA),  UC(0xCEB),  /*------*/      UC(0xCEC),  UC(0xCEE),  UC(0xCED),  UC(0xCEF),  UC(0xCE6),  KC_BSPC,
            UC(0xC83),          UC(0xC86),  UC(0xC88),  UC(0xC8A),  UC(0xC8F),  UC(0xC93),  /*------*/      UC(0xCA0),  UC(0xCA2),  UC(0xCA5),  UC(0xC99),  KC_TRNS,    UC(0xCAD),
            KC_TRNS,            UC(0xC96),  UC(0xC98),  UC(0xC9B),  UC(0xC9D),  UC(0xC94),  /*------*/      KC_TRNS,    UC(0xCA3),  UC(0xC8B),  UC(0xC9E),  KC_TRNS,    KC_TRNS,
                                    KC_LCTL,    KC_SPC,     LT(2, KC_ESC),                  /*------*/              LT(1,KC_SLSH),  LGUI_T(KC_ENT),  LALT_T(KC_BSLS)),
    [6] = LAYOUT_split_3x6_3(
            KC_TRNS,            UC(0xC96),  UC(0xC98),  UC(0xC9B),  UC(0xC9D),  UC(0x000),  /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,
            UC(0xCC8),          UC(0xCBE),  UC(0xCBF),  UC(0xCC1),  UC(0xCC6),  UC(0xCCA),  /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,
            UC(0xCCC),          KC_TRNS,    UC(0xCC0),  UC(0xCC2),  UC(0xCC7),  UC(0xCCB),  /*------*/      KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,    KC_TRNS,
                                    KC_LCTL,    KC_SPC,     LT(2, KC_ESC),                  /*------*/              LT(1,KC_SLSH),  LGUI_T(KC_ENT),  LALT_T(KC_BSLS)),
        [7] = LAYOUT_split_3x6_3(
            TG(7),             KC_Q,        KC_W,       KC_E,       KC_R,       KC_T,       /*------*/      KC_F,       KC_G,       KC_C,       KC_R,       KC_L,       KC_BSPC,
            KC_TAB,             KC_A,       KC_S,       KC_D,       KC_F,       KC_G,       /*------*/      KC_D,       KC_H,       KC_T,       KC_N,       KC_S,       KC_MINS,
            KC_LSFT,            KC_SCLN,    KC_Q,       KC_J,       KC_K,       KC_X,       /*------*/      KC_B,       KC_M,       KC_W,       KC_V,       KC_Z,       KC_RSFT,
                                    KC_LCTL,    KC_SPC, KC_ESC,                  /*------*/              LT(1,KC_SLSH),  LGUI_T(KC_ENT),  LALT_T(KC_BSLS)),
};

#ifdef OLED_ENABLE
oled_rotation_t oled_init_user(oled_rotation_t rotation) {
    if (!is_keyboard_master()) {
        return OLED_ROTATION_180;  // flips the display 180 degrees if offhand
    }
    return rotation;
}

#define L_BASE 0
#define L_LOWER 2
#define L_RAISE 4
#define L_ADJUST 8

void oled_render_layer_state(void) {
    oled_write_P(PSTR("Layer: "), false);
    switch (layer_state) {
        case L_BASE:
            oled_write_ln_P(PSTR("Default"), false);
            break;
        case L_LOWER:
            oled_write_ln_P(PSTR("Lower"), false);
            break;
        case L_RAISE:
            oled_write_ln_P(PSTR("Raise"), false);
            break;
        case L_ADJUST:
        case L_ADJUST | L_LOWER:
        case L_ADJUST | L_RAISE:
        case L_ADJUST | L_LOWER | L_RAISE:
            oled_write_ln_P(PSTR("Adjust"), false);
            break;
    }
}

char keylog_str[24] = {};

const char code_to_name[60] = {' ', ' ', ' ', ' ', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'R', 'E', 'B', 'T', '_', '-', '=', '[', ']', '\\', '#', ';', '\'', '`', ',', '.', '/', ' ', ' ', ' '};

void set_keylog(uint16_t keycode, keyrecord_t *record) {
  char name = ' ';
    if ((keycode >= QK_MOD_TAP && keycode <= QK_MOD_TAP_MAX) ||
        (keycode >= QK_LAYER_TAP && keycode <= QK_LAYER_TAP_MAX)) { keycode = keycode & 0xFF; }
  if (keycode < 60) {
    name = code_to_name[keycode];
  }

  // update keylog
  snprintf(keylog_str, sizeof(keylog_str), "%dx%d, k%2d : %c",
           record->event.key.row, record->event.key.col,
           keycode, name);
}

void oled_render_keylog(void) {
    oled_write(keylog_str, false);
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
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0xc0, 0xe0, 0xc0, 0x80, 
        0xc0, 0xf8, 0xf8, 0xf8, 0xe0, 0x60, 0x60, 0x60, 0x30, 0x30, 0x30, 0x30, 0x20, 0x00, 0x00, 0x00, 
        0x80, 0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe0, 0xf0, 
        0xf0, 0x00, 0x00, 0x80, 0xf3, 0xff, 0xfe, 0x7c, 0x00, 0x00, 0x00, 0x00, 0xc0, 0xff, 0xfe, 0xfe, 
        0x3c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0xc0, 0xf0, 0xf8, 0xfc, 0x3c, 0x0e, 0x06, 0x06, 0x0e, 0x00, 0x00, 0x00, 
        0xe0, 0xf0, 0xf8, 0xfc, 0x3c, 0x0e, 0x86, 0xc6, 0xfc, 0xfc, 0xfc, 0xfe, 0x1d, 0x81, 0xe1, 0xfd, 
        0xff, 0xff, 0x3f, 0x83, 0xe0, 0xf0, 0xf8, 0xfc, 0x5e, 0x66, 0x26, 0x3e, 0x1c, 0x00, 0x80, 0xe0, 
        0xfb, 0xff, 0x7f, 0x1f, 0x03, 0x03, 0x83, 0xff, 0xfe, 0xfc, 0x00, 0x00, 0xfe, 0xfe, 0xfc, 0x78, 
        0x3c, 0x1c, 0x0e, 0x86, 0xfe, 0xfe, 0xfe, 0xfc, 0x00, 0x00, 0x80, 0xc0, 0xf8, 0xfe, 0xfe, 0x3c, 
        0x80, 0xf0, 0xfe, 0xff, 0xff, 0x3f, 0x07, 0x00, 0x00, 0xc0, 0xf8, 0xfe, 0xff, 0xff, 0x1f, 0x03, 
        0x00, 0x00, 0xc0, 0xf0, 0xf8, 0xfc, 0x3c, 0x0e, 0x8e, 0xc6, 0xfe, 0xfc, 0xfc, 0xfe, 0x1e, 0x80, 
        0xe0, 0xfb, 0xff, 0x7f, 0x1f, 0x03, 0x03, 0x83, 0xff, 0xfe, 0xfc, 0x10, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x07, 0x0f, 0x1f, 0x1f, 0x1e, 0x1c, 0x0e, 0x0e, 0x07, 0x03, 0x00, 0x07, 
        0x0f, 0x1f, 0x1f, 0x1f, 0x0e, 0x0f, 0x07, 0x07, 0x1f, 0x3f, 0x1f, 0x00, 0xfe, 0xff, 0xff, 0xff, 
        0xff, 0xe1, 0xe0, 0xe7, 0x6f, 0x0f, 0x1f, 0x1f, 0x1c, 0x0e, 0x0e, 0x07, 0x00, 0x07, 0x0f, 0x1f, 
        0x1f, 0x1f, 0x00, 0x00, 0x18, 0x7e, 0xff, 0xff, 0xff, 0xe0, 0xf8, 0xff, 0xff, 0xff, 0x0f, 0x0e, 
        0x1c, 0x1c, 0x1e, 0x1f, 0x0f, 0x0f, 0x07, 0x01, 0x00, 0x04, 0x1f, 0x3f, 0x3f, 0x3f, 0x3f, 0x20, 
        0x0f, 0x0f, 0x1f, 0x1f, 0x1f, 0x1c, 0x0c, 0x0c, 0x00, 0x0f, 0x1f, 0x1f, 0x1f, 0x1c, 0x1c, 0x0c, 
        0x04, 0x07, 0x0f, 0x0f, 0x1f, 0x1f, 0x0e, 0x0f, 0x07, 0x03, 0x1f, 0x3f, 0x3f, 0x00, 0x06, 0x0f, 
        0x1f, 0x1f, 0x1f, 0x00, 0x00, 0x10, 0x7e, 0xff, 0xff, 0xff, 0xe0, 0xe0, 0x40, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 
        0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0x3f, 0x7f, 0x7f, 0x00, 0x00, 0x00, 
    };
    oled_write_raw_P(raw_logo, sizeof(raw_logo));
}

bool oled_task_user(void) {
    if (is_keyboard_master()) {
        oled_render_layer_state();
        oled_render_keylog();
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
