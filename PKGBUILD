#  Maintainer: Marcelo K. <marcelo.pdvtec@gmail.com>
# shellcheck disable=all

pkgname=bridge_ip
pkgver=1.0.0
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
sha256sums=("eb6a3e24df069ea34dc764cd308c183d504c8fa1cbaad5320c019dc986b81876"
            "7c23123cc6d0367d829aa14955eb718f55b698621b0ec4e6747a2a913303499c"
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
