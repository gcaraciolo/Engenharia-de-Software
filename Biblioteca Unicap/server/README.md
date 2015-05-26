- Stub server para uso com nodejs

1) Instalacao do framework:
npm install -g stubby

2) Uso com arquivo:
stubby -d 1000002355_email.json 

3) Uso com arquivo monitorado (permite que se o json for alterado nao seja necessario reiniciar o server)
stubby -d 1000002355_email.json -w

4) Acesso ao servico (usado pelo app):
http://127.0.0.1:8882/api

5) Acesso ao servico admin (permite visualizar no browser os detalhes da api)
http://127.0.0.1:8889

6) Eh possivel atualizar o servico com stubs da mesma forma que a versao em java, para mais detalhes ver:
https://github.com/mrak/stubby4node