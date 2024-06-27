

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

Para especificar um IP manualmente para a ponte, forneça o endereço IP como argumento ao executar o script:

```bash
bridge_ip-set 192.168.15.115
```

Da mesma forma, para definir uma interface específica, passe o nome da interface após o IP:

```bash
bridge_ip-set 192.168.15.115 eth0
```

## Configuração de Serviço

Para configurar um serviço que inicie automaticamente com o sistema, utilize o seguinte comando (como superusuário):

```bash
systemctl enable bridge_ip-set.service
```

## Configuração do IP da Interface Bridge para o Serviço

Edite o arquivo `/opt/bridge_ip/bridge_ip.conf` e configure as variáveis correspondentes.

---
