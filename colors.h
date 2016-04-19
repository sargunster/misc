#pragma once

#define RESET  "\x1B[0m"
#define ESC_RED  "\x1B[31m"
#define ESC_GREEN  "\x1B[32m"
#define ESC_YELLOW  "\x1B[33m"
#define ESC_BLUE  "\x1B[34m"
#define ESC_MAGENTA  "\x1B[35m"
#define ESC_CYAN  "\x1B[36m"
#define ESC_WHITE  "\x1B[37m"
#define ESC_BOLD "\x1B[1m"
#define ESC_UNDERLINE "\x1B[4m"

#define RED(x) ESC_RED x RESET
#define GREEN(x) ESC_GREEN x RESET
#define YELLOW(x) ESC_YELLOW x RESET
#define BLUE(x) ESC_BLUE x RESET
#define MAGENTA(x) ESC_MAGENTA x RESET
#define CYAN(x) ESC_CYAN x RESET
#define WHITE(x) ESC_WHITE x RESET

#define BOLD(x) ESC_BOLD x RESET
#define UNDERLINE(x) ESC_UNDERLINE x RESET
