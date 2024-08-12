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
        "${pkgname}.conf.pacnew")
sha256sums=("b5d47c18ef4651c1b27c7dc937199002d90e3950fd48e78911d2eedb7652f931"
            "76b652d916d91243990d6e571b389ae73438637ecf42a66ef481833613d88716"
            "750500b2290d85b4d46f864487f7f21374752a9af4bd35afdd3b411688b30418")

package() {
    #cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/etc/systemd/system"
    install -m0755 $srcdir/${pkgname} "${pkgdir}/opt/${pkgname}/${pkgname}"
    ln -sf "$pkgdir/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -m0644 $srcdir/${pkgname}.conf.pacnew "${pkgdir}/opt/${pkgname}/${pkgname}.conf.pacnew"
    install -m0644 $srcdir/${pkgname}.service "${pkgdir}/etc/systemd/system/${pkgname}.service"
} 
