### BCredi | Teste Back End

Este projeto é uma implementação do teste back end para a BCredi.
Usando a [API do GitHub](https://developer.github.com/v3/), a aplicação é capaz de buscar e armazenar os repositórios destaques
de até 5 linguagens à escolha do usuário, podendo também ser incluído um termo na pesquisa.

### Recursos e Limitações
A aplicação é limitada a realizar buscas somente de repositórios públicos e suas principais informações.
Apesar disso, é exibido um botão para abrir o repositório no GitHub para visualizar mais detalhes. Além disso, a aplicação:
* busca repositórios baseado no termo inserido e/ou linguagens escolhidas (até 5);
* armazena pesquisas e resultados assim que forem executadas;
* permite a visualização e exclusão pública das pesquisas;
* resultados de pesquisa são exibidos em [Bootstrap Cards](https://getbootstrap.com/docs/4.0/components/card/#card-columns), 
ordenadas decrescentemente pelo número de estrelas;
* interface integrada com [Bootstrap 4](https://getbootstrap.com/) e [jQuery 3](https://jquery.com/).

### Live Deploy
O aplicativo pode ser acessado através do link: https://bcredi.herokuapp.com

> O link fornecido acima é apenas para demonstração temporária. Se você não consegue acessá-lo, isso quer dizer que o deploy já foi desativado.