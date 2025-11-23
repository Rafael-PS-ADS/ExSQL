use empresa_db

db.createCollection("funcionarios")
db.createCollection("departamentos")
db.createCollection("projetos")
db.createCollection("salarios")
db.createCollection("ferias")

db.funcionarios.insertMany([
  {_id: 1, nome: "João Silva", cargo: "Desenvolvedor", departamento: "TI", salario: 5000, data_admissao: new Date("2022-03-15")},
  {_id: 2, nome: "Maria Santos", cargo: "Analista de RH", departamento: "Recursos Humanos", salario: 4500, data_admissao: new Date("2021-07-20")},
  {_id: 3, nome: "Pedro Oliveira", cargo: "Gerente", departamento: "Vendas", salario: 7000, data_admissao: new Date("2020-11-10")},
  {_id: 4, nome: "Ana Costa", cargo: "Designer", departamento: "Marketing", salario: 4000, data_admissao: new Date("2023-01-05")},
  {_id: 5, nome: "Carlos Lima", cargo: "Estagiário", departamento: "TI", salario: 1500, data_admissao: new Date("2024-02-01")}
])

db.departamentos.insertMany([
  {_id: 1, nome: "TI", gerente: "João Silva", orcamento_anual: 500000, quantidade_funcionarios: 10},
  {_id: 2, nome: "Recursos Humanos", gerente: "Maria Santos", orcamento_anual: 200000, quantidade_funcionarios: 5},
  {_id: 3, nome: "Vendas", gerente: "Pedro Oliveira", orcamento_anual: 800000, quantidade_funcionarios: 15},
  {_id: 4, nome: "Marketing", gerente: "Ana Costa", orcamento_anual: 300000, quantidade_funcionarios: 8},
  {_id: 5, nome: "Financeiro", gerente: "Roberta Almeida", orcamento_anual: 400000, quantidade_funcionarios: 6}
])

db.projetos.insertMany([
  {_id: 1, nome: "Sistema de Gestão", departamento: "TI", orcamento: 100000, data_inicio: new Date("2024-01-15"), data_termino: new Date("2024-06-30")},
  {_id: 2, nome: "Campanha Publicitária", departamento: "Marketing", orcamento: 50000, data_inicio: new Date("2024-02-01"), data_termino: new Date("2024-05-15")},
  {_id: 3, nome: "Treinamento Corporativo", departamento: "Recursos Humanos", orcamento: 25000, data_inicio: new Date("2024-03-01"), data_termino: new Date("2024-04-30")},
  {_id: 4, nome: "Expansão de Mercado", departamento: "Vendas", orcamento: 150000, data_inicio: new Date("2024-01-01"), data_termino: new Date("2024-12-31")},
  {_id: 5, nome: "Otimização de Processos", departamento: "TI", orcamento: 75000, data_inicio: new Date("2024-02-15"), data_termino: new Date("2024-08-31")}
])

db.salarios.insertMany([
  {_id: 1, funcionario_id: 1, valor: 5000, data_pagamento: new Date("2024-03-01"), bonus: 1000},
  {_id: 2, funcionario_id: 2, valor: 4500, data_pagamento: new Date("2024-03-01"), bonus: 500},
  {_id: 3, funcionario_id: 3, valor: 7000, data_pagamento: new Date("2024-03-01"), bonus: 2000},
  {_id: 4, funcionario_id: 4, valor: 4000, data_pagamento: new Date("2024-03-01"), bonus: 300},
  {_id: 5, funcionario_id: 5, valor: 1500, data_pagamento: new Date("2024-03-01"), bonus: 0}
])

db.ferias.insertMany([
  {_id: 1, funcionario_id: 1, data_inicio: new Date("2024-07-01"), data_fim: new Date("2024-07-15"), dias_solicitados: 15, status: "aprovado"},
  {_id: 2, funcionario_id: 2, data_inicio: new Date("2024-08-01"), data_fim: new Date("2024-08-20"), dias_solicitados: 20, status: "pendente"},
  {_id: 3, funcionario_id: 3, data_inicio: new Date("2024-12-01"), data_fim: new Date("2024-12-30"), dias_solicitados: 30, status: "aprovado"},
  {_id: 4, funcionario_id: 4, data_inicio: new Date("2024-06-15"), data_fim: new Date("2024-06-30"), dias_solicitados: 15, status: "aprovado"},
  {_id: 5, funcionario_id: 5, data_inicio: new Date("2024-09-01"), data_fim: new Date("2024-09-10"), dias_solicitados: 10, status: "pendente"}
])

use ecommerce_db

db.createCollection("clientes")
db.createCollection("produtos")
db.createCollection("pedidos")
db.createCollection("categorias")
db.createCollection("avaliacoes")

db.clientes.insertMany([
  {_id: 1, nome: "Fernanda Rodrigues", email: "fernanda@email.com", telefone: "11999999999", endereco: {rua: "Rua A, 123", cidade: "São Paulo", estado: "SP"}, data_cadastro: new Date("2023-05-10")},
  {_id: 2, nome: "Ricardo Alves", email: "ricardo@email.com", telefone: "11888888888", endereco: {rua: "Av. B, 456", cidade: "Rio de Janeiro", estado: "RJ"}, data_cadastro: new Date("2023-08-15")},
  {_id: 3, nome: "Juliana Mendes", email: "juliana@email.com", telefone: "11777777777", endereco: {rua: "Rua C, 789", cidade: "Belo Horizonte", estado: "MG"}, data_cadastro: new Date("2024-01-20")},
  {_id: 4, nome: "Marcos Souza", email: "marcos@email.com", telefone: "11666666666", endereco: {rua: "Av. D, 321", cidade: "Porto Alegre", estado: "RS"}, data_cadastro: new Date("2023-11-05")},
  {_id: 5, nome: "Patricia Lima", email: "patricia@email.com", telefone: "11555555555", endereco: {rua: "Rua E, 654", cidade: "Salvador", estado: "BA"}, data_cadastro: new Date("2024-02-28")}
])

db.produtos.insertMany([
  {_id: 1, nome: "Smartphone Galaxy", categoria: "Eletrônicos", preco: 1200.00, estoque: 50, marca: "Samsung", descricao: "Smartphone com 128GB de armazenamento"},
  {_id: 2, nome: "Notebook Dell", categoria: "Informática", preco: 2500.00, estoque: 25, marca: "Dell", descricao: "Notebook com 8GB RAM e SSD 256GB"},
  {_id: 3, nome: "Fone de Ouvido Bluetooth", categoria: "Áudio", preco: 150.00, estoque: 100, marca: "Sony", descricao: "Fone sem fio com cancelamento de ruído"},
  {_id: 4, nome: "Tablet iPad", categoria: "Eletrônicos", preco: 1800.00, estoque: 30, marca: "Apple", descricao: "Tablet com tela de 10.9 polegadas"},
  {_id: 5, nome: "Smart TV 55\"", categoria: "Eletrônicos", preco: 2000.00, estoque: 15, marca: "LG", descricao: "TV LED 4K com Smart TV"}
])

db.pedidos.insertMany([
  {_id: 1, cliente_id: 1, produtos: [{ produto_id: 1, quantidade: 1, preco_unitario: 1200.00 }, { produto_id: 3, quantidade: 2, preco_unitario: 150.00 }], total: 1500.00, data_pedido: new Date("2024-03-01"), status: "entregue"},
  {_id: 2, cliente_id: 2, produtos: [{ produto_id: 2, quantidade: 1, preco_unitario: 2500.00 }], total: 2500.00, data_pedido: new Date("2024-03-02"), status: "processando"},
  {_id: 3, cliente_id: 3, produtos: [{ produto_id: 4, quantidade: 1, preco_unitario: 1800.00 }, { produto_id: 5, quantidade: 1, preco_unitario: 2000.00 }], total: 3800.00, data_pedido: new Date("2024-03-03"), status: "enviado"},
  {_id: 4, cliente_id: 4, produtos: [{ produto_id: 1, quantidade: 1, preco_unitario: 1200.00 }, { produto_id: 3, quantidade: 1, preco_unitario: 150.00 }], total: 1350.00, data_pedido: new Date("2024-03-04"), status: "entregue"},
  {_id: 5, cliente_id: 5, produtos: [{ produto_id: 2, quantidade: 1, preco_unitario: 2500.00 }, { produto_id: 5, quantidade: 1, preco_unitario: 2000.00 }], total: 4500.00, data_pedido: new Date("2024-03-05"), status: "processando"}
])

db.categorias.insertMany([
  {_id: 1, nome: "Eletrônicos", descricao: "Dispositivos eletrônicos e gadgets", quantidade_produtos: 3, ativa: true},
  {_id: 2, nome: "Informática", descricao: "Computadores e acessórios", quantidade_produtos: 1, ativa: true},
  {_id: 3, nome: "Áudio", descricao: "Fones de ouvido e equipamentos de som", quantidade_produtos: 1, ativa: true},
  {_id: 4, nome: "Casa e Decoração", descricao: "Produtos para casa e decoração", quantidade_produtos: 0, ativa: true},
  {_id: 5, nome: "Livros", descricao: "Livros e materiais de leitura", quantidade_produtos: 0, ativa: false}
])

db.avaliacoes.insertMany([
  {_id: 1, produto_id: 1, cliente_id: 1, nota: 5, comentario: "Excelente produto, entrega rápida!", data_avaliacao: new Date("2024-03-10")},
  {_id: 2, produto_id: 2, cliente_id: 2, nota: 4, comentario: "Bom notebook, poderia ter mais memória RAM", data_avaliacao: new Date("2024-03-11")},
  {_id: 3, produto_id: 3, cliente_id: 4, nota: 5, comentario: "Som de alta qualidade, recomendo!", data_avaliacao: new Date("2024-03-12")},
  {_id: 4, produto_id: 1, cliente_id: 4, nota: 4, comentario: "Bom smartphone, bateria poderia durar mais", data_avaliacao: new Date("2024-03-13")},
  {_id: 5, produto_id: 5, cliente_id: 3, nota: 5, comentario: "TV com imagem incrível, superou expectativas", data_avaliacao: new Date("2024-03-14")}
])