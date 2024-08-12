#  Maintainer: Marcelo K. <marcelo.pdvtec@gmail.com>
# shellcheck disable=all

pkgname=bridge-set
pkgver=1.0.7
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
sha256sums=("ad3d875a4bcdbc343f1f541eb50a84999067d790a5a6df3ba78593d1b3a97525"
            "76b652d916d91243990d6e571b389ae73438637ecf42a66ef481833613d88716"
            "750500b2290d85b4d46f864487f7f21374752a9af4bd35afdd3b411688b30418")

package() {
    #cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/etc/systemd/system"
    #install -m0755 $srcdir/${pkgname} "${pkgdir}/opt/${pkgname}/${pkgname}"
    #ln -sf "$pkgdir/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -m0755 $srcdir/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -m0644 $srcdir/${pkgname}.conf.pacnew "${pkgdir}/opt/${pkgname}/${pkgname}.conf.pacnew"
    install -m0644 $srcdir/${pkgname}.service "${pkgdir}/etc/systemd/system/${pkgname}.service"
} 

