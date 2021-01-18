FROM imagem:versao

WORKDIR /pasta1/pasta2
COPY . .

RUN ls -la #VER ARQUIVOS
CMD ["./comando"] # "./main.py" processo que segura a execução do container

#docker build . #executa o dockerfile naquela pasta

#docker build -t nomeImagem . #executa o dockerfile adicionando um nome para a img


################################################################
FROM goalng:1.15 as builder 

WORKDIR /pasta1/pasta2
COPY . .
RUN GOOS= linux go build -ldflags="-s -w"

FROM scratch #IMAGEM QUASE ZERADA, AO FINAL É GERADO UM AQUIVO EXECUTAVEL
WORKDIR /pasta1/pasta2
COPY --from=builder /go/src/fullcycle/fullcycle .
CMD ["./fullcycle"]

#docker build . #executa o dockerfile naquela pasta

