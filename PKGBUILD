#  Maintainer: Marcelo K. <marcelo.pdvtec@gmail.com>
# shellcheck disable=all

pkgname=bridge_ip
pkgver=1.0.4
pkgrel=1
arch=('any')
license=('CUSTOM')
install='bridge_ip.install'
depends=('iproute2' 'networkmanager' 'bridge-utils')
#optdepends=('bridge-utils')
url="https://github.com/elppans/bridge_ip"
pkgdesc="Cria uma ponte de rede (bridge) para combinar várias interfaces em uma única conexão."
source=("bridge_ip-set"
        "bridge_ip-set.service"
        "bridge_ip.conf")
sha256sums=("af8453bd2d7d69a0baff4be07bad2c5b4097adb0e13e86f27478800878edef90"
            "ca4b5050e4e083673f2f0cec442538f68df022601c5f50b1ca9df10491946b7a"
            "fc278f47632cfbfc2fd479ab4ce0f5934c952baba86de7e49cfa29f322bf5465")

package() {
    #cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt/bridge_ip"
    mkdir -p "${pkgdir}/etc/systemd/system"
    install -m0755 $srcdir/bridge_ip-set "${pkgdir}/opt/bridge_ip/bridge_ip-set"
    ln -sf "${pkgdir}/opt/bridge_ip/bridge_ip-set" "${pkgdir}/usr/bin/bridge_ip-set"
    install -m0644 $srcdir/bridge_ip.conf "${pkgdir}/opt/bridge_ip/bridge_ip.conf"
    install -m0644 $srcdir/bridge_ip-set.service "${pkgdir}/etc/systemd/system/bridge_ip-set.service"
} 
