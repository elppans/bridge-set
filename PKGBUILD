#  Maintainer: Marcelo K. <marcelo.pdvtec@gmail.com>
# shellcheck disable=all

pkgname=bridge-set
pkgver=1.0.7
pkgrel=3
arch=('any')
license=('CUSTOM')
# install='bridge-set.install'
depends=('iproute2' 'networkmanager' 'bridge-utils' 'dhclient')
optdepends=('dhcpcd')
pkgdesc="Cria uma ponte de rede (bridge) para combinar várias interfaces em uma única conexão."
url="https://github.com/elppans/${pkgname}"
source=("${pkgname}"
	"${pkgname}.service"
	"${pkgname}.conf.pacnew")
# source=("git+${url}.git")
sha256sums=("9b076de10a3eda7631d038c9e9869ea137c211af428303fdf64d490f559b9d01"
	"76b652d916d91243990d6e571b389ae73438637ecf42a66ef481833613d88716"
	"750500b2290d85b4d46f864487f7f21374752a9af4bd35afdd3b411688b30418")

package() {
	if [ "$source" = "git+${url}.git" ]; then
		srcdir="$srcdir/${pkgname}"
		export srcdir
	fi
	#cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	mkdir -p "${pkgdir}/etc/systemd/system"
	#install -m0755 $srcdir/${pkgname} "${pkgdir}/opt/${pkgname}/${pkgname}"
	#ln -sf "$pkgdir/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -m0755 "$srcdir/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -m0644 "$srcdir/${pkgname}.conf.pacnew" "${pkgdir}/opt/${pkgname}/${pkgname}.conf.pacnew"
	install -m0644 "$srcdir/${pkgname}.service" "${pkgdir}/etc/systemd/system/${pkgname}.service"
}

post_install() {
	systemctl daemon-reload
	cat <<END

O bridge-set foi instalado com sucesso...
Faça o comando "${pkgname}" sem parametros para ver o help;
Para mais informações, acesse o README no github.

END
	# Caminho para o arquivo bridge-set.conf
	bridgesetconf="/opt/${pkgname}/${pkgname}.conf"
	bridgesetconfnew="/opt/${pkgname}/${pkgname}.conf.pacnew"

	# Verifica se o arquivo existe
	if [ -f "$bridgesetconf" ]; then
		echo "warning: $bridgesetconf installed as $bridgesetconfnew"
	else
		# Renomeia o novo arquivo para o nome original
		mv "$bridgesetconfnew" "$bridgesetconf"
	fi
}

post_upgrade() {
    systemctl daemon-reload
	# Caminho para o arquivo bridge-set.conf
	bridgesetconf="/opt/${pkgname}/${pkgname}.conf"
	bridgesetconfnew="/opt/${pkgname}/${pkgname}.conf.pacnew"

	# Verifica se o arquivo existe
	if [ -f "$bridgesetconf" ]; then
		echo "warning: $bridgesetconf installed as $bridgesetconfnew"
	else
		# Renomeia o novo arquivo para o nome original
		mv "$bridgesetconfnew" "$bridgesetconf"
	fi
}

post_remove() {

	cat <<END

O "${pkgname}" foi removido.

END
}
