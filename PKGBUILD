#  Maintainer: Marcelo K. <marcelo.pdvtec@gmail.com>
# shellcheck disable=all

pkgname=bridge-set
pkgver=1.0.5
pkgrel=1
arch=('any')
license=('CUSTOM')
install='bridge-set.install'
depends=('iproute2' 'networkmanager' 'bridge-utils' 'dhclient')
optdepends=('dhcpcd')
url="https://github.com/elppans/${pkgname}"
pkgdesc="Cria uma ponte de rede (bridge) para combinar várias interfaces em uma única conexão."
source=("${pkgname}"
        "${pkgname}.service"
        "${pkgname}.conf")
sha256sums=("af8453bd2d7d69a0baff4be07bad2c5b4097adb0e13e86f27478800878edef90"
            "17b53b8d72a17548283c4851f8cd0971d9966e8dfb8d7619ccccf0666ac49759"
            "fc278f47632cfbfc2fd479ab4ce0f5934c952baba86de7e49cfa29f322bf5465")

package() {
    #cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/etc/systemd/system"
    install -m0755 $srcdir/${pkgname} "${pkgdir}/opt/${pkgname}/${pkgname}"
    ln -sf "${pkgdir}/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -m0644 $srcdir/${pkgname}.conf "${pkgdir}/opt/${pkgname}/${pkgname}.conf"
    install -m0644 $srcdir/${pkgname}.service "${pkgdir}/etc/systemd/system/${pkgname}.service"
} 
