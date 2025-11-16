# Projeto_Primeiro_Emprego
Avaliação do Projeto Primeiro Emprego na Bahia (2024 - 2025)

Nota Técnica

Metodologia de Análise e Práticas de Reprodutibilidade

Esta nota técnica descreve o fluxograma de trabalho, os protocolos de segurança de dados e os elementos técnicos empregados na análise de dados da avaliação do Projeto Primeiro Emprego (PPE).

1. Fluxograma de Trabalho e Reprodutibilidade

Para garantir a transparência, a reprodutibilidade e a eficiência da análise, foi adotado um ecossistema de ferramentas modernas de ciência de dados. A escolha de cada componente foi deliberada para aderir às boas práticas de pesquisa.

Linguagem R: Escolhida como a linguagem de programação estatística padrão, dada a sua robustez, vasta comunidade e ecossistema de pacotes de análise.

Positron IDE (ou RStudio): Utilizado como o Ambiente de Desenvolvimento Integrado (IDE), permitindo a gestão centralizada de scripts, dados, versionamento e compilação de relatórios.

Pacotes tidyverse (notadamente dplyr): Empregado para toda a etapa de manipulação e tratamento dos dados. A sua "gramática" de verbos (filter, mutate, group_by, summarise) torna o código de limpeza altamente legível e auditável.

Pacote tidyplots: Utilizado para a padronização sistemática de todas as saídas gráficas. Ao definir um estilo global (conforme visto no script Relatório_beneficiários.qmd), garante-se a coesão visual e a qualidade profissional dos gráficos, economizando tempo e evitando a repetição de código.

Github: Adotado como o sistema de controle de versão. Essencial para a integridade da pesquisa, o Github registra cada alteração nos arquivos de código (.R) e no relatório (.qmd), permitindo a auditoria completa do processo e o trabalho colaborativo.

Quarto (.qmd): Utilizado como a ferramenta de "programação letrada" (literate programming) para a geração do relatório final. O Quarto permite fundir a narrativa textual (prosa) com o código R e suas saídas (gráficos e tabelas) em um único documento-fonte, garantindo que o relatório seja 100% reprodutível.

2. Conformidade com a Lei Geral de Proteção de Dados (LGPD)

Dois instrumentos de coleta distintos foram utilizados:

Questionário dos Gestores (Apêndice A): Este instrumento não coletou nenhuma informação de identificação pessoal (como nome, CPF, e-mail ou matrícula). Por ser totalmente anonimizado na origem, seus dados agregados e o instrumento estão disponíveis no repositório Github do projeto.

Questionário dos Beneficiários (Apêndice B): Este instrumento, para fins de controle de duplicidade e acompanhamento longitudinal, continha dados de identificação.

Em conformidade com a LGPD, a base de dados bruta dos beneficiários (Apêndice B) não está disponível publicamente no repositório Github ou em qualquer outro meio de acesso livre.

A disponibilização desta base de dados para fins de auditoria ou replicação da pesquisa por pares acadêmicos ou órgãos de controle é condicionada a uma solicitação formal por e-mail. Mediante a solicitação, os dados serão fornecidos com a supressão completa de todas as colunas ou variáveis que permitam a identificação, direta ou indireta, dos respondentes.

3. Elementos Técnicos da Análise

A metodologia de análise foi desenhada para garantir transparência e robustez, priorizando a fidelidade aos dados coletados.

Limpeza e Tratamento dos Dados

Adotou-se uma política estrita de não-imputação ou substituição de dados. Valores ausentes (NA) não foram preenchidos por médias, medianas ou qualquer outro método sintético. Esta abordagem garante que as análises reflitam exclusivamente as respostas fornecidas pelos participantes, sem introduzir viés do pesquisador.

A limpeza dos dados, realizada com o pacote dplyr, focou-se exclusivamente na eliminação de observações comprovadamente inválidas em questões abertas (como as de localização, que foram "poluídas" por entradas incorretas) e na renomeação/reordenação de variáveis para facilitar a análise.

Estrutura de Código e Execução

O fluxo de trabalho em R foi estruturado para máxima modularidade e reprodutibilidade:

Manipulação (dplyr): O pacote dplyr foi utilizado para filtrar, selecionar, recodificar (mutate) e sumarizar (group_by, summarise) os dados brutos, preparando-os para a visualização.

Visualização (tidyplots): O pacote tidyplots foi usado para gerar todas as saídas gráficas. Uma função de estilo global foi definida no início do script, garantindo que todos os gráficos seguissem a mesma identidade visual (tamanho, fonte, cores) de forma automática.

Estrutura de Arquivos: O projeto é composto por dois relatórios mestres (gestores.qmd e beneficiarios.qmd). Cada saída (gráfico ou tabela) possui seu próprio script .R individual (ex: q21.R, q22.R, etc.).

Execução Individual: É possível executar cada script .R de forma independente para verificar ou replicar uma saída específica.

Execução Completa: O arquivo .qmd mestre utiliza a função source() para chamar e executar, em ordem, todos os scripts .R individuais, compilando o relatório final.
