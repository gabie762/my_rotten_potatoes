# 🍅 RottenPotatoes - Sistema de Avaliação de Filmes

Uma aplicação web Rails para catalogar e avaliar filmes, inspirada no Rotten Tomatoes.

## Sobre o Projeto

O RottenPotatoes é um sistema de gerenciamento de filmes que permite:
- Listar todos os filmes cadastrados
- Visualizar detalhes de um filme específico
- Adicionar novos filmes
- Editar informações de filmes existentes
- Excluir filmes do catálogo
- **Ordenar filmes por título ou data de lançamento** (funcionalidade implementada)

## Tecnologias Utilizadas

- **Ruby** 3.4.x
- **Rails** 8.0.3
- **SQLite3** (banco de dados)
- **HTML/ERB** (templates)
- **CSS3** (estilização)
- **Bootsnap** (otimização de inicialização)

## Estrutura do Projeto

```
my_rotten_potatoes/
├── app/
│   ├── controllers/
│   │   └── movies_controller.rb    # Controlador principal
│   ├── models/
│   │   └── movie.rb               # Modelo de dados
│   ├── views/
│   │   └── movies/                # Views dos filmes
│   │       ├── index.html.erb     # Lista de filmes (com ordenação)
│   │       ├── show.html.erb      # Detalhes do filme
│   │       ├── new.html.erb       # Formulário de novo filme
│   │       └── edit.html.erb      # Formulário de edição
│   └── assets/
│       └── stylesheets/
│           └── application.css    # Estilos customizados
├── config/
│   ├── routes.rb                  # Configuração de rotas
│   └── database.yml               # Configuração do banco
├── db/
│   ├── migrate/                   # Migrações do banco
│   └── schema.rb                  # Schema atual
└── README.md
```

## Configuração e Instalação

### Pré-requisitos

- Ruby 3.4.x ou superior
- Rails 8.0.x
- SQLite3
- Bundler

### Passos de Instalação

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/gabie762/my_rotten_potatoes.git
   cd my_rotten_potatoes
   ```

2. **Instale as dependências:**
   ```bash
   bundle install
   ```

3. **Configure o banco de dados:**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed  # (opcional) para dados de exemplo
   ```

4. **Inicie o servidor:**
   ```bash
   rails server
   ```

5. **Acesse a aplicação:**
   ```
   http://localhost:3000/movies
   ```

## Funcionalidades Principais

### CRUD Completo de Filmes
- **CREATE**: Adicionar novos filmes com título, classificação e data de lançamento
- **READ**: Listar todos os filmes e visualizar detalhes individuais
- **UPDATE**: Editar informações de filmes existentes
- **DELETE**: Remover filmes do catálogo

### Ordenação Dinâmica
**Funcionalidade especial implementada:**
- Clique no cabeçalho **"Movie Title"** para ordenar alfabeticamente
- Clique no cabeçalho **"Release Date"** para ordenar por data de lançamento
- A coluna ativa fica destacada visualmente
- URLs dinâmicas: `/movies?sort_by=title` ou `/movies?sort_by=release_date`

## Interface

### Página Principal (`/movies`)
- Lista de todos os filmes em formato de tabela
- Cabeçalhos clicáveis para ordenação
- Links para visualizar, editar e adicionar filmes
- Design responsivo com hover effects

### Detalhes do Filme (`/movies/:id`)
- Informações completas do filme
- Rating e data de lançamento
- Descrição detalhada
- Botões para editar ou voltar à lista

### Formulários
- Interface limpa para adicionar/editar filmes
- Campos validados: título, rating (G, PG, PG-13, R, NC-17), data
- Feedback visual de sucesso/erro

## Arquitetura Técnica

### Controller (`MoviesController`)
```ruby
def index
    @sort_by = params[:sort_by]
    case @sort_by
    when 'title'
        @movies = Movie.order(:title)
    when 'release_date'
        @movies = Movie.order(:release_date)
    else
        @movies = Movie.all
    end
end
```

### Modelo (`Movie`)
```ruby
class Movie < ActiveRecord::Base
end
```

### Rotas RESTful
```ruby
resources "movies"  # Gera todas as rotas CRUD
```

## Estilos CSS

### Características Visuais
- **Tema**: Moderno com cores azul/vermelho
- **Grid System**: Inspirado no Bootstrap
- **Responsivo**: Adaptável a diferentes tamanhos de tela
- **Hover Effects**: Interações suaves
- **Destaque de Ordenação**: Coluna ativa em laranja

### Classes CSS Principais
- `.sorted`: Destaque para coluna ordenada
- `.btn-primary`: Botões principais
- `.form-control`: Campos de formulário
- `.row/.col-*`: Sistema de grid

## Como Usar

1. **Visualizar Filmes**: Acesse `/movies`
2. **Ordenar**: Clique nos cabeçalhos "Movie Title" ou "Release Date"
3. **Adicionar Filme**: Clique em "Add Movie"
4. **Ver Detalhes**: Clique no título de qualquer filme
5. **Editar**: Na página de detalhes, clique "Edit this movie"

## Comandos Úteis

```bash
# Iniciar servidor de desenvolvimento
rails server

# Executar migrações
rails db:migrate

# Acessar console Rails
rails console

# Ver rotas disponíveis
rails routes

# Executar testes
rails test
```

## Modelo de Dados

### Tabela `movies`
- `id`: Identificador único (Integer, Primary Key)
- `title`: Título do filme (String, obrigatório)
- `rating`: Classificação etária (String: G, PG, PG-13, R, NC-17)
- `release_date`: Data de lançamento (Date)
- `description`: Descrição do filme (Text, opcional)
- `created_at`: Data de criação (DateTime)
- `updated_at`: Data de atualização (DateTime)

## Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## Licença
Este projeto é para fins educacionais e de aprendizado.
---

*Desenvolvido como parte do aprendizado de Ruby on Rails e implementação de funcionalidades web interativas.*
