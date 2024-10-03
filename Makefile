SHELL=/bin/bash
DESTDIR=
BINDIR=${DESTDIR}/usr/bin
OPTDIR=${DESTDIR}/opt/bridge-set
DOCDIR=${DESTDIR}/opt/bridge-set/doc
INFODIR=${DESTDIR}/usr/share/doc/bridge-set
#MODE=775
MODE=664
DIRMODE=755

.PHONY: build

install:
	@echo "            Script bridge-set"
	@echo ":: Aguarde, instalando software bridge-set em: ${BINDIR}"
	@install -Dm755 "usr/bin/bridge-set" "/usr/bin/bridge-set"
	@install -Dm644 "opt/bridge-set/bridge-set.conf.pacnew" "/opt/bridge-set/bridge-set.conf.pacnew"
	@install -Dm644 "etc/systemd/system/bridge-set.service" "/etc/systemd/system/bridge-set.service"
	@install -d ${DOCDIR}/
	@install -d ${INFODIR}/
	@cp Makefile README.md ${DOCDIR}/
	@cp Makefile README.md ${INFODIR}/
	systemctl enable bridge-set
	systemctl status bridge-set --lines 2
	@systemctl daemon-reload
	@echo ":: Feito! bridge-set software instalado em: ${BINDIR}"
	@echo
uninstall:
	systemctl disable bridge-set
	@systemctl daemon-reload
	systemctl stop bridge-set
	@rm ${BINDIR}/bridge-set
	@rm "/opt/bridge-set/bridge-set.conf.pacnew"
	@rm "/etc/systemd/system/bridge-set.service"
	@rm -rf ${DOCDIR}
	@rm -rf ${OPTDIR}
	@rm -rf ${INFODIR}
	@echo "bridge-set foi removido."
