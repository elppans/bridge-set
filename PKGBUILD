#  Maintainer: Marcelo K. <marcelo.pdvtec@gmail.com>
# shellcheck disable=all

pkgname=bridge_ip
pkgver=1.0.4
pkgrel=2
arch=('any')
license=('CUSTOM')
install='bridge_ip.install'
depends=('iproute2' 'networkmanager' 'bridge-utils')
#optdepends=('bridge-utils')
url="https://github.com/elppans/bridge_ip"
pkgdesc="Cria uma ponte de rede (bridge) para combinar várias interfaces em uma única conexão."
source=("bridge-set"
        "bridge-set.service"
        "bridge_ip.conf")
sha256sums=("af8453bd2d7d69a0baff4be07bad2c5b4097adb0e13e86f27478800878edef90"
            "17b53b8d72a17548283c4851f8cd0971d9966e8dfb8d7619ccccf0666ac49759"
            "fc278f47632cfbfc2fd479ab4ce0f5934c952baba86de7e49cfa29f322bf5465")

package() {
    #cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt/bridge_ip"
    mkdir -p "${pkgdir}/etc/systemd/system"
    install -m0755 $srcdir/bridge-set "${pkgdir}/opt/bridge_ip/bridge-set"
    ln -sf "${pkgdir}/opt/bridge_ip/bridge-set" "${pkgdir}/usr/bin/bridge-set"
    install -m0644 $srcdir/bridge_ip.conf "${pkgdir}/opt/bridge_ip/bridge_ip.conf"
    install -m0644 $srcdir/bridge-set.service "${pkgdir}/etc/systemd/system/bridge-set.service"
} 
