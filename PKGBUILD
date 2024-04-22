# Maintainer: Marcelo K. <marcelo.pdvtec@gmail.com>

pkgname=bridge_ip
pkgver=1.0.0
pkgrel=1
arch=('any')
license=('CUSTOM')
install='bridge_ip.install'
depends=('iproute2' 'networkmanager')
optdepends=('bridge-utils')
url="https://github.com/elppans/bridge_ip"
pkgdesc="Cria uma ponte de rede (bridge) para combinar várias interfaces em uma única conexão."
source=("bridge_ip-set"
        "bridge_ip-set.service"
        "bridge_ip.conf")
sha256sums=("950af170e07549899cb243bb423eebea70e44bc9fc6662295a60ee7303dac7f9"
            "759ecc08e71e9f609a67fe7089dee0fbaf9e3be2095861f8fa4998c3cc64ab14"
            "5f0afd58ad4a7fcc8fb788e65e52aabd524a765dc85ce86d2cbd75f6fa014d38")

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
