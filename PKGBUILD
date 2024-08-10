#  Maintainer: Marcelo K. <marcelo.pdvtec@gmail.com>
# shellcheck disable=all

pkgname=bridge_ip
pkgver=1.0.1
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
sha256sums=("3d4a9468ba5513ca9456200cd65c082a398b54c024adc606a3bd5abac041e875"
            "35a7b1d541698a08146b741d865fdc952491566c26db25f3b8bc495cda0e76fc"
            "dbeceb6fc5fc8d3696839fcababc61ed2c4ed4ef917a77177fea47334d346a25")

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
