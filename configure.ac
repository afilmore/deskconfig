dnl Process this file with autoconf to produce a configure script.

AC_INIT(deskconfig, 0.1)

AC_CONFIG_HEADERS([config.h])

AM_INIT_AUTOMAKE([1.11])

dnl AM_SILENT_RULES([yes])

AC_PROG_CC

dnl LT_INIT

dnl Check for vala
AM_PROG_VALAC([0.10.0])

pkg_modules="gtk+-3.0"
PKG_CHECK_MODULES(DESKCONFIG, [$pkg_modules])

AC_OUTPUT([
    Makefile
    data/Makefile
    src/Makefile
])

