
> **1. ingredients** (Ingredientes)

* `id`
* `name` (Ex: Cacau, Açúcar)
* `price_per_unit`
* `unit` (Ex: Libra, Grama) - *O texto pede para acompanhar a unidade.*

> **2. donuts**

* `id`
* `name`
* `is_gluten_free` (Booleano) - *O texto pede "se é sem glúten".*
* `price_per_donut`

> **3. donut_ingredients** **[TABELA ASSOCIATIVA]**

* `donut_id`
* `ingredient_id`
* *Esta tabela permite que você consulte os ingredientes de cada donut.*

> **4. customers** (Clientes)

* `id`
* `first_name`
* `last_name`
* *(O "history" não é um campo, é o resultado da relação com a tabela orders).*

> **5. orders** (Pedidos)

* `id`
* `customer_id` (Foreign Key para `customers`)
* *Aqui registramos QUEM fez o pedido e o ID do pedido.*

> **6. order_items** (Itens do Pedido) **[TABELA DE ASSOCIATIVA]**

* `order_id` (Foreign Key para `orders`)
* `donut_id` (Foreign Key para `donuts`)
* `quantity` — *Para registrar que o Luis Singh pediu "3 donuts de chocolate"*
