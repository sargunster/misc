#pragma once

#define RST  "\x1B[0m"
#define KRED  "\x1B[31m"
#define KGRN  "\x1B[32m"
#define KYEL  "\x1B[33m"
#define KBLU  "\x1B[34m"
#define KMAG  "\x1B[35m"
#define KCYN  "\x1B[36m"
#define KWHT  "\x1B[37m"
#define KBOLD "\x1B[1m"
#define KUNDL "\x1B[4m"

#define RED(x) KRED x RST
#define GRN(x) KGRN x RST
#define YEL(x) KYEL x RST
#define BLU(x) KBLU x RST
#define MAG(x) KMAG x RST
#define CYN(x) KCYN x RST
#define WHT(x) KWHT x RST

#define BOLD(x) KBOLD x RST
#define UNDL(x) KUNDL x RST
