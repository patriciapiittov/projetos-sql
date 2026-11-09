# Mais Moda Store: Banco de Dados Relacional

Banco de dados relacional em **MySQL** para gerenciar uma loja de roupas: equipe, estoque, clientes e vendas.

## 🗂️ Estrutura do banco

```mermaid
erDiagram
    funcionarios ||--o{ vendas : "realiza"
    clientes ||--o{ vendas : "faz"
    vendas ||--|{ vendas_produtos : "contém"
    Roupas ||--o{ vendas_produtos : "aparece em"

    funcionarios {
        INT id PK
        VARCHAR nome
        VARCHAR funcao
    }
    clientes {
        INT id_cliente PK
        VARCHAR nome
        CHAR CPF
    }
    Roupas {
        INT id PK
        VARCHAR peca
        INT estoque
    }
    vendas {
        INT id_pedido PK
        DATETIME data_pedido
        INT id_cliente FK
        INT id_vendedor FK
    }
    vendas_produtos {
        INT id_pedido PK, FK
        INT id_produto PK, FK
        INT quantidade
    }
```

| Tabela | Função |
|---|---|
| `funcionarios` | Cadastro da equipe (nome e função) |
| `Roupas` | Cadastro das peças e da quantidade em estoque |
| `clientes` | Cadastro de clientes |
| `vendas` | Pedidos: data, cliente e vendedor responsável |
| `vendas_produtos` | Itens de cada pedido |

## 🔑 Conceitos aplicados

- **Chave primária** com `AUTO_INCREMENT`
- **Chaves estrangeiras** (`FOREIGN KEY`) ligando vendas a clientes e funcionários
- **Relacionamento N:N** entre vendas e roupas, resolvido com a tabela `vendas_produtos` e **chave primária composta** (`id_pedido`, `id_produto`)
- Alteração de estrutura com `ALTER TABLE` (inclusão da coluna `quantidade`)

## ▶️ Como executar

1. Abra o **MySQL Workbench** (ou outro cliente MySQL)
2. Abra o arquivo [`mais-moda-store.sql`](mais-moda-store.sql)
3. Execute o script inteiro. Ele cria o banco `mais_moda_store`, as tabelas e os dados de exemplo.

> Os nomes e CPFs são fictícios, usados só para teste.
