## Process this file with automake to produce Makefile.in

bin_PROGRAMS = deskconfig

AM_CPPFLAGS = \
	-DPACKAGE_LOCALE_DIR=\""$(prefix)/$(DATADIRNAME)/locale"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	$(DESKCONFIG_CFLAGS)

##	-DPACKAGE_UI_DIR=\""$(datadir)/deskconfig/ui"\" \

AM_CFLAGS =\
	 -Wall \
	 -g

deskconfig_SOURCES = \
	DeskConfig.vala \
	PageBase.vala \
	PageIntro.vala \
	PageMode.vala \
	PageBrowser.vala \
	PageMail.vala \
	PageInternet.vala \
	PageOffice.vala \
	PageImage.vala \
	PageMultimedia.vala \
	PageAccessories.vala \
	PageGames.vala \
	PageProgramming.vala \
	PageConfirm.vala \
	PageSummary.vala \
	CommandRadioButton.vala \
	CommandCheckButton.vala \
	Job.vala

deskconfig_VALAFLAGS = \
	--vapidir=$(top_srcdir)/vapi \
	--pkg config \
	--pkg gtk+-3.0

deskconfig_LDFLAGS = \
	-Wl,--export-dynamic

deskconfig_LDADD = \
	$(DESKCONFIG_LIBS)

CLEANFILES = $(patsubst %.vala,%.c,$(filter %.vala, $(SOURCES))) deskconfig_vala.stamp

