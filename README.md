
---

# Script `bridge-set`

O script `bridge-set` foi projetado para facilitar a criação e gerenciamento de uma ponte de rede em seu computador. Ao executá-lo, o script realiza as seguintes ações:

1. **Detecção Automática de Interfaces:**
   - Identifica todas as interfaces de rede físicas disponíveis, como Ethernet.

2. **Criação da Bridge:**
   - Gera uma nova interface de rede chamada `br0`, que atuará como a ponte.

3. **Adição de Interfaces:**
   - Incorpora as interfaces de rede físicas detectadas à ponte `br0`.

4. **Configuração de IP:**
   - Atribui um endereço IP à ponte para garantir conectividade consistente.

5. **Ativação:**
   - Ativa a ponte.

## Uso

Criar uma rede Bridge com IP via DHCP, faça o comando:

```bash
bridge-set -c
```

Criar uma rede Bridge especificando um IP manualmente para a ponte:

```bash
bridge-set -c 192.168.15.115/24
```

Da mesma forma, para definir uma interface específica, passe o nome da interface após o IP:

```bash
bridge-set -c 192.168.15.115/24 eth0
```

Remover a rede Bridge:

```bash
bridge-set -s
```

Reiniciar a conexão de rede principal e rede Bridge:

```bash
bridge-set -r
```

Verificar opções de comando:

```bash
bridge-set -h
```

>Se fizer o comando sem parâmetro algum, será direcionado ao "Help".

## Configuração de Serviço

Para configurar um serviço que inicie automaticamente com o sistema, utilize o seguinte comando (como superusuário):

```bash
systemctl enable bridge-set.service
```
Para iniciar o serviço (start), utilize o seguinte comando (como superusuário):
>Para parar, deve dar (stop) e usar o comando para "Remover a rede Bridge", como mencionado mais acima

```bash
systemctl start bridge-set.service
```

Para verificar o status do serviço, utilize o seguinte comando:

```bash
systemctl status bridge-set.service
```

## Configuração do IP FIXO da Interface Bridge para o Serviço

Edite o arquivo `/opt/bridge-set/bridge-set.conf` e configure as variáveis correspondentes.

- **interfaces**: (Opcional) Esta variável armazena uma lista de interfaces de rede físicas (como “eth0”, “eth1”, etc.).

Exemplo:
```bash
interfaces="eth0"
```

- **bridge_name**: Esta variável é usada para especificar o nome da bridge de rede.
Uma bridge é uma interface de rede virtual que combina várias interfaces físicas em uma única interface lógica.
Ela permite que os pacotes de rede sejam encaminhados entre as interfaces físicas associadas à bridge.
O padrão para o nome da bridge costuma ser “**br0**”, mas você pode escolher um nome diferente, se desejar.
O importante é que o nome seja único e não conflite com outros dispositivos de rede.
Exemplo:
```bash
bridge_name="bridge0"
```
- **bridge_ip**: Essa variável define o endereço IP fixo para a bridge.  
Uso: Insira um `endereço IP` específico para a bridge e utilize um "`prefixo de sub-rede`"  
O prefixo de sub-rede indica quantos bits da máscara de sub-rede são usados para identificar a rede.  
Exemplos:  
1) Endereço IP com prefixo de sub-rede Classe A, "/8" (255.0.0.0)
```bash
bridge_ip="10.10.1.100/8"
```
2) Endereço IP com prefixo de sub-rede Classe B, "/16" (255.255.0.0)  
```bash
bridge_ip="10.10.1.100/16"
```

3) Endereço IP com prefixo de sub-rede Classe C, "/24" (255.255.255.0)  
```bash
bridge_ip="192.168.1.100/24"
```

- **bridge_mask**: Esta variável define a máscara de sub-rede para a bridge.  
Devido a adição do prefixo em "bridge_ip", não é necessário configurar a máscara.  
NÃO comente ou remova esta variável, ou o Gateway não irá funcionar.  

- **bridge_gw**: Esta variável define o gateway (roteador) para a bridge.  
Exemplo:  
```bash
bridge_gw="192.168.1.1"  
```
>Se foi configurado "bridge_ip", **deve** configurar o Gateway em "bridge_gw".  
---

## Bridge-Set com Suporte a Redes Ethernet e Wi-Fi

Este bridge-set oferece suporte a redes Ethernet e Wi-Fi, com diferenças importantes de funcionalidade:

- **Ethernet**: Permite comunicação com máquinas virtuais e outros dispositivos na rede local.
- **Wi-Fi**: Restringe a comunicação a máquinas virtuais devido a limitações na maioria dos adaptadores Wi-Fi.

### Limitações do Wi-Fi em Modo Bridge

A maioria dos adaptadores Wi-Fi não oferece suporte nativo ao modo bridge, pois o Wi-Fi lida com endereços MAC de maneira diferente do Ethernet. Muitos drivers de Wi-Fi não permitem múltiplos endereços MAC na mesma interface.

### Alternativas para Suporte Completo em Wi-Fi

Para configurar o bridge-set em redes Wi-Fi, considere as seguintes alternativas:

#### 1. Adaptador Wi-Fi USB com Modo AP
Um adaptador Wi-Fi USB que suporte o modo AP (Access Point) pode ser utilizado em modo bridge. Embora essa configuração exija ajustes adicionais, ela é uma solução prática para expandir o suporte ao Wi-Fi.

#### 2. Adaptador PCI/PCIe com Suporte a Modo AP
Adaptadores Wi-Fi PCI ou PCIe oferecem suporte ao modo AP e geralmente proporcionam melhor desempenho e alcance em comparação com adaptadores USB. Eles são uma opção robusta, especialmente para desktops, e permitem funcionalidades avançadas como modo bridge e multi-SSID.

### Vantagens dos Adaptadores PCIe com Modo AP
- **Sinal Potente**: Adaptadores PCIe normalmente possuem antenas maiores e melhor captação de sinal.
- **Drivers Completos**: Suporte abrangente a drivers para modo AP e funcionalidades de bridge.
- **Estabilidade e Desempenho**: Conexões mais estáveis e velocidades de transferência superiores às dos adaptadores USB.

### Exemplos de Modelos Compatíveis
1. **TP-Link Archer T6E/T9E**: Modelos que suportam modo AP e são compatíveis com Linux. Consulte o site do fabricante para verificar a compatibilidade de drivers.
2. **Intel Wi-Fi 6 AX200/AX210**: Chipsets Intel Wi-Fi 6 que oferecem suporte para modo AP e modo bridge, embora a funcionalidade dependa do driver.
3. **Qualcomm Atheros QCA988x**: Chipsets Atheros que suportam modo AP nativamente no Linux.

### Configuração e Suporte
Para configurar o adaptador no modo AP:
- **Compatibilidade de Drivers**: Verifique se o driver Linux do adaptador suporta o modo AP.
- **Ferramentas de Configuração**: Utilize ferramentas como `hostapd` no Linux para configurar o modo AP.

---

## Verificar Suporte ao Modo AP

Para verificar se seu adaptador de rede suporta o modo Access Point (AP), você pode usar algumas ferramentas e comandos no Linux. Aqui estão os métodos recomendados:

### 1. Usar o `iw list`
O comando `iw` é uma ferramenta poderosa para interagir com interfaces de rede sem fio. Siga os passos abaixo:

1. **Instale o `iw`** (se ainda não estiver instalado):
   ```bash
   sudo pacman -S iw
   ```

2. **Execute o comando**:
   ```bash
   iw list
   ```

3. **Verifique a saída**: Procure pela seção intitulada `Supported interface modes`. Se encontrar `AP` listado, seu adaptador suporta o modo Access Point.

### 2. Usar o `iwconfig`
Outra ferramenta útil é o `iwconfig`, parte do pacote `wireless_tools`. Embora o `iw` seja mais moderno, o `iwconfig` ainda pode ser útil.

1. **Instale o `wireless_tools`** (se ainda não estiver instalado):
   ```bash
   sudo pacman -S wireless_tools
   ```

2. **Execute o comando**:
   ```bash
   iwconfig
   ```

3. **Verifique as interfaces listadas**: Veja se a interface desejada aparece e se há indicação sobre suporte ao modo AP.

### 3. Verificar com `dmesg`
Os logs do kernel podem fornecer informações sobre o driver do adaptador.

1. **Execute o comando**:
   ```bash
   dmesg | grep -i 'wifi\|wlan\|network'
   ```

2. **Procure por mensagens relacionadas**: Mensagens podem indicar se o adaptador foi reconhecido corretamente e se possui suporte ao modo AP.

### 4. Consultar a Documentação do Adaptador
Verifique a documentação do seu adaptador ou o site do fabricante para confirmar o suporte ao modo AP.

### Exemplo de Saída do `iw list`
Aqui está um exemplo da saída do comando `iw list`:

```
...
Supported interface modes:
     * IBSS
     * managed
     * AP
     * AP/VLAN
...
```

Se `AP` estiver listado, isso indica que o adaptador tem suporte ao modo Access Point.
---
### Solução de problemas

- dnsmasq não inicia:

Se o dnsmasq reportar um erro ao tentar vincular (bind) o socket do servidor DHCP com a mensagem **"endereço já está em uso"**, isso geralmente indica que outro processo está utilizando a mesma porta ou recurso de rede.

#### libvirt+dnsmasq

Se você utiliza máquinas virtuais com libvirt (como no Virt Manager ou QEMU), o serviço dnsmasq gerenciado pelo libvirt pode estar ocupando as mesmas portas ou processos.  
Siga o tópico [Archlinux, Solução dnsmasq não inicia#Desativando a Rede default do Libvirt e o Serviço dnsmasq](https://elppans.github.io/doc-linux/archlinux_solucao_dnsmasq_nao_inicia#desativando-a-rede-default-do-libvirt-e-o-servi%C3%A7o-dnsmasq)  

#### NetworkManager+dnsmasq
Serviços como NetworkManager, systemd-resolved ou outros servidores DNS (como bind ou unbound) podem estar em execução e utilizando as mesmas portas que o dnsmasq, causando conflitos.  
Siga o tópico [Archlinux, Solução dnsmasq não inicia#Desativar o DNS interno do NetworkManager](https://elppans.github.io/doc-linux/archlinux_solucao_dnsmasq_nao_inicia#2-desativar-o-dns-interno-do-networkmanager).
