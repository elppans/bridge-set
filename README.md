 

---

# Script `bridge_ip-set`

O script `bridge_ip-set` foi projetado para facilitar a criação e gerenciamento de uma ponte de rede em seu computador. Ao executá-lo, o script realiza as seguintes ações:

1. **Detecção Automática de Interfaces:**
   - Identifica todas as interfaces de rede físicas disponíveis, como Ethernet.

2. **Criação da Bridge:**
   - Gera uma nova interface de rede chamada `br0`, que atuará como a ponte.

3. **Adição de Interfaces:**
   - Incorpora as interfaces de rede físicas detectadas à ponte `br0`.

4. **Configuração de IP:**
   - Atribui um endereço IP fixo à ponte para garantir conectividade consistente.

5. **Ativação:**
   - Ativa a ponte.

## Uso

Criar uma rede Bridge com IP via DHCP, faça o comando:

```bash
bridge_ip-set create_bridge
```

Criar uma rede Bridge especificando um IP manualmente para a ponte:

```bash
bridge_ip-set create_bridge 192.168.15.115/24
```

Da mesma forma, para definir uma interface específica, passe o nome da interface após o IP:

```bash
bridge_ip-set create_bridge 192.168.15.115/24 eth0
```

Remover a rede Bridge:

```bash
bridge_ip-set remove_bridge
```

Reiniciar a conexão de rede principal:

```bash
bridge_ip-set restart_connection
```
Se fizer o comando sem parâmetro algum, será direcionado ao "Help".

## Configuração de Serviço

Para configurar um serviço que inicie automaticamente com o sistema, utilize o seguinte comando (como superusuário):

```bash
systemctl enable bridge_ip-set.service
```

## Configuração do IP da Interface Bridge para o Serviço

Edite o arquivo `/opt/bridge_ip/bridge_ip.conf` e configure as variáveis correspondentes.  

- **interfaces**: (Opcional)Esta variável armazena uma lista de interfaces de rede físicas (como “eth0”, “eth1”, etc.).  
 
>Exemplo: interfaces="eth0"  

- **bridge_ip**: Essa variável define o endereço IP fixo para a bridge.
Uso: Insira um endereço IP específico para a bridge e utilize um "prefixo de sub-rede"  
O prefixo de sub-rede indica quantos bits da máscara de sub-rede são usados para identificar a rede.  
Exemplo 1: `bridge_ip="10.10.1.100/8"` (endereço IP com prefixo de sub-rede Classe A, "/8" (255.0.0.0))  
Exemplo 2: `bridge_ip="10.10.1.100/16"` (endereço IP com prefixo de sub-rede Classe B, "/16" (255.255.0.0))  
Exemplo 1: `bridge_ip="192.168.1.100/24"` (endereço IP com prefixo de sub-rede Classe C, "/24" (255.255.255.0))  

- **bridge_mask**: Esta variável define a máscara de sub-rede para a bridge.  
Devido a adição do prefixo em "bridge_ip", não é necessário configurar a máscara.  
NÃO comente ou remova esta variável, ou o Gateway não irá funcionar.  

- **bridge_gw**: Esta variável define o gateway (roteador) para a bridge.  

>Exemplo: bridge_gw="192.168.1.1"  

Se foi configurado "bridge_ip", **deve** configurar o Gateway em "bridge_gw".  

---
