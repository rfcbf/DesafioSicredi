# Desenvolvimento

Foi desenvolvido um app de como desafio para a empresa Sicredi.

Desenvolvido por: Renato Ferraz Castelo Branco Ferreira

email: renato.ferraz@me.com

Tel: (61) 99368-4628

|  |  |
|--|--|
| <img src="https://github.com/rfcbf/DesafioSicredi/blob/main/Imagens/1.jpg" width="333" height="720" /> | <img src="https://github.com/rfcbf/DesafioSicredi/blob/main/Imagens/2.jpg" width="333" height="720" />
| <img src="https://github.com/rfcbf/DesafioSicredi/blob/main/Imagens/3.jpg" width="333" height="720" /> | <img src="https://github.com/rfcbf/DesafioSicredi/blob/main/Imagens/4.jpg" width="333" height="720" />
| <img src="https://github.com/rfcbf/DesafioSicredi/blob/main/Imagens/5.jpg" width="333" height="720" /> | 

## Instalação e Pré-requistos

1) Maquina com MacOS

2) Xcode 12

3) Baixar esse repositório

5) Descompactar o projeto

6) Abrir o arquivo Sicredi.xcodeproj

9) Quando o projeto estiver aberto no Xcode, executar o app

  
## O que foi feito?
  * Criar um aplicativo em Swift que consuma uma REST API e exiba uma listagem de eventos  **OK**:
  * Cada item da lista deve permitir acesso à detalhes do evento  **OK**:
  * No detalhe do evento é importante exibir suas informações e opções de check-in e compartilhamento  **OK**:
    
### Pontos extras
  Não são obrigatórios, mas seria legal ter no seu projeto:

  * Usar RxSwift
  * MVVM **OK**:
  
### Adicionais
  
  * App desenvolvido em SwiftUI;
  * Animação do Splash;
  * Animacao ao abrir o evento;
  * Enviar localização para o Apple Maps;
  * Tela de usuario.
  
## Bibliotecas usadas ( Swift Package ) 

* SwiftUIX -> https://github.com/SwiftUIX/SwiftUIX

* Defaults -> https://github.com/sindresorhus/Defaults

* SWWebImageSwiftUI -> https://github.com/SDWebImage/SDWebImageSwiftUI.git

* FloatingLabelTextFieldSwiftUI -> https://github.com/kishanraja/FloatingLabelTextFieldSwiftUI.git

* AlertToast -> https://github.com/elai950/AlertToast.git

* PartialSheet -> https://github.com/AndreaMiotto/PartialSheet.git

  

------------

Seja bem vindo! Obrigado pelo interesse em participar do nosso processo seletivo.

Leia atentamente as instruções abaixo e não hesite em entrar em contato com a gente :)

##Objetivo

Criar um aplicativo em Swift que consuma uma REST API e exiba uma listagem de eventos
Cada item da lista deve permitir acesso à detalhes do evento
No detalhe do evento é importante exibir suas informações e opções de check-in e compartilhamento

##Sobre seu código

#Analisaremos:

Organização do código
Boas práticas de programação
Possíveis bugs
Tratamento de erros
O uso de frameworks e libraries é livre
Uso de testes unitários
AutoLayout
Diferencial:

Usar RxSwift
MVVM

##API

A API de eventos está disponivel em:
http://5f5a8f24d44d640016169133.mockapi.io/api/events

Para acessar cada detalhe do evento basta adicionar o ID do item ao final da URL. Ex: http://5f5a8f24d44d640016169133.mockapi.io/api/events/1

Para realizar o check-in faça um POST no seguinte endereço: http://5f5a8f24d44d640016169133.mockapi.io/api/checkin

O POST deve conter os dados do interessado (Nome, e-mail) e o id do evento. Ex:

{ "eventId": "1", "name": "Otávio", "email": "otavio_souza@..." }

##Dicas

Faça commits frequentes. Queremos entender como você pensa :)
Fique a vontade para utilizar animações e recursos especias (ex: parallax etc...)
Teste bem seu aplicativo, evite crashes

##Observações importantes

Fique à vontade para tirar dúvidas em qualquer etapa do processo
A API pode ter falhas, prepare seu aplicativo para contorná-las
Crie um repositório e compartilhe conosco para avaliarmos o seu código
Bom teste!