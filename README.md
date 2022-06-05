Implementação de aplicação desenvolvida com Flutter usando conceitos de Clean Architecture e TDD.

A aplicação consiste em realizar requisições em uma API e exibir os resultados na tela.

O foco maior da aplicação está em utilizar os conceitos de CLEAN e TDD para o desenvolvimento, e não em criar um visual (frontend) elegante.

# Sobre CLEAN
CLEAN, ou Clean Architecture, consiste em um conceito no desenvolvimento de software, onde, a organização do código é criada de modo a facilitar manutenção, organização e ter menos dependências entre o código, ou seja, ter um código menos acoplado, principalmente no que se refere a pacotes externo a aplicação.

Um dos principais objetivos do CLEAN é manter a lógica do negócio aparte de todo o resto da aplicação. Outras vantagens de usar CLEAN nos projetos são:
- Manter um código testável
- Manter um código independente da interface de usuário
- Manter um código independente de banco de dados

Uma das desvantagens de se usar CLEAN é a quantidade de arquivos e pastas que são criadas.

Também é importante lembrar que para ter uma arquitetura CLEAN bem aplicada é importante usar os princípios SOLID.

E claro, CLEAN é apenas uma sugestão de arquitetura, cabe a equipe e aos desenvolvedores definirem aquilo que é melhor para cada projeto.

Clean foi desenvolvido por Robert C. Martin [github](https://github.com/unclebob).

# Sobre TDD
Test Driven Development, ou Desenvolvimento Orientado por Testes. Basicamente é um técnica de desenvolvimento onde se cria primeiro o teste para uma determinada parte da aplicação e depois é criada a implementação real daquela parte. 

Desenvolver testes primeiro, entrega a vantagem de que o código que vai para produção será entregue com a menor taxa de erros possível (claro, se os testes forem bem criados).