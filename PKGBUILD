#  Maintainer: Marcelo K. <marcelo.pdvtec@gmail.com>
# shellcheck disable=all

pkgname=bridge-set
pkgver=1.0.9
pkgrel=3
arch=('any')
license=('CUSTOM')
install='bridge-set.install'
depends=('iproute2' 'networkmanager' 'bridge-utils' 'dhclient')
optdepends=('dhcpcd')
pkgdesc="Cria uma ponte de rede (bridge) para combinar várias interfaces em uma única conexão."
url="https://github.com/elppans/${pkgname}"
source=("${pkgname}"
	# "${pkgname}.service"
	"${pkgname}.conf.pacnew")
# source=("git+${url}.git")
sha256sums=("0f77b0ab165c5065fb7c30dba182fd7d43b648e8ccfd1e29e56d3f95841ad890"
	# "76b652d916d91243990d6e571b389ae73438637ecf42a66ef481833613d88716"
	"63e8dabd4ca7fd583ce931ea9d93ab783e2dbba8f52d47e186d48d283bbf630c")

package() {
	# Configuração do diretório source, se ativado tipo {git}
	if [ "$source" = "git+${url}.git" ]; then
		srcdir="$srcdir/${pkgname}"
		export srcdir
	fi

	# Criação dos diretórios necessários
	#cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	mkdir -p "${pkgdir}/etc/systemd/system"
	

	# Criação do serviço bridge-set.service
cat > "$srcdir/${pkgname}.service" <<EOF
[Unit]
# Configuração da Interface Bridge
Description=Configuração da Interface Bridge
After=network.target
After=NetworkManager.service

# Comando para criar a bridge
[Service]
Type=forking
ExecStartPre=/bin/sleep 5
ExecStart=/usr/bin/${pkgname} -c
ExecReload=/usr/bin/${pkgname} -r
ExecStop=/usr/bin/${pkgname} -s
Restart=always
RestartSec=3s

# serviço será executado durante a inicialização padrão do sistema
[Install]
WantedBy=default.target
EOF

	# Instalação dos arquivos em seus respectivos diretórios
	#install -m0755 $srcdir/${pkgname} "${pkgdir}/opt/${pkgname}/${pkgname}"
	#ln -sf "$pkgdir/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -m0755 "$srcdir/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -m0644 "$srcdir/${pkgname}.conf.pacnew" "${pkgdir}/opt/${pkgname}/${pkgname}.conf.pacnew"
	install -m0644 "$srcdir/${pkgname}.service" "${pkgdir}/etc/systemd/system/${pkgname}.service"
	
}

cat > "${pkgname}.install" <<EOF
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
	if [ -f "\${bridgesetconf}" ]; then
		echo "warning: \${bridgesetconf} installed as \${bridgesetconfnew}"
	else
		# Renomeia o novo arquivo para o nome original
		mv "\${bridgesetconfnew}" "\${bridgesetconf}"
	fi
}

post_upgrade() {
    post_install
}

post_remove() {

	cat <<END

O "${pkgname}" foi removido.

END
}
EOF
