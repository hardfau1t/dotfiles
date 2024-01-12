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
            KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      /*------*/      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,
            MI_A2,      MI_B2,      MI_C3,      MI_D3,      MI_E3,      MI_F3,      /*------*/      MI_G3,      MI_A3,      MI_B3,      MI_C4,      MI_D4,      MI_E4,
            KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      /*------*/      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,
                                    KC_NO,    MI_OCTD,     MO(2),                   /*------*/              MO(1),      MI_OCTU,      KC_NO),
    /*******************************************************************************************************************************************************/
        [1] = LAYOUT_split_3x6_3(
            KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      /*------*/      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,
            MI_A3,      MI_B3,      MI_C4,      MI_D4,      MI_E4,      MI_F4,      /*------*/      MI_G4,      MI_A4,      MI_B4,      MI_C5,      MI_D5,      MI_E5,
            KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      /*------*/      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,
                                    KC_NO,      KC_NO,    MO(3),                    /*------*/           MO(1),           KC_NO,          KC_NO),
            /*******************************************************************************************************************************************************/
        [2] = LAYOUT_split_3x6_3(
            KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      /*------*/      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,
            KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      /*------*/      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,
            KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      /*------*/      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,      KC_NO,
                                    KC_NO,      KC_NO,    MO(2),                    /*------*/              MO(3),              MOD_RGUI,                 KC_NO),

            /*******************************************************************************************************************************************************/

        [3] = LAYOUT_split_3x6_3(
            KC_NO,      KC_NO,      KC_NO,          KC_NO,          KC_NO,          KC_NO,    /*------*/            KC_NO,          KC_NO,          KC_NO,          KC_NO,          KC_NO,          KC_NO,
            MI_ON,      MI_C3,      MI_D3,      MI_E3,      MI_F3,      MI_G3,      /*------*/      MI_A3,      MI_B3,      MI_C4,      MI_D4,      MI_E4,      MI_OFF,
            KC_NO,      KC_NO,      KC_NO,          KC_NO,          KC_NO,          KC_NO,   /*------*/             KC_NO,          KC_NO,          KC_NO,          KC_NO,          KC_NO,          KC_NO,
                                        KC_NO,          KC_NO,      MO(2),                        /*------*/              MO(1),        MOD_RGUI,        TG(3)),
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
        255,255, 63, 15,  7,  7,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  7,  7, 15,
        63,255,255,255,255,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,192,254,255, 14,  0,128,128,128,128,  0,  0,  0,  0,  0,128,128,128,128,128,  0,128,128,  0,  0,128,128,  0,  0,128,128,128,128,128,128,  0,  0,  0,  0,128,128,128,128,128,224,254,255,  6,  0,128,128,128,240,248,188,142,134,134,  6,  0,  0,128,128,128,128,128,128,128,128,  0,128,128,128,  0,  0,  0,  0,  0,128,128,  0,  0,  0,  0,  6,230,255,255, 15,  0,  0,  0,190,255,247,227,243, 63, 31, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 
        0,255,255,255,255,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,248,255, 63, 15,  7,  3,  3,  1,255,255,127, 24,126,255,231,195,195,193,225,249,255,255,  3,224,255,255, 15,  7,  7,  3,  3,  1,  1,  1,  1,124,254,255,199,195,225,225,113,253,255, 63,  0,  0,  1,  1,241,255,127,  3,  1,  1,  1, 60,126,255,195,195,193,193,225,253,255, 15,  1,126,255,239,193,224,224,112,240,255,255,  3,  0,  0,  0,  0,252,255, 63,  1,  0, 60,126,255,199,195,193,195,255,127,126,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 
        
        2,255,255,
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
