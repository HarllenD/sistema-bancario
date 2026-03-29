programa
{
	cadeia nome[100]
	real saldo[100]
	inteiro total = 0
	inteiro opcao = 0

	funcao inteiro buscarConta(cadeia buscar)
	{
		inteiro i = 0
		para(i = 1; i <= total; i++)
		{
			se(nome[i] == buscar)
			{
				retorne i
			}
		}
		retorne 0
	}

	funcao vazio criarConta()
	{
		se(total < 100)
		{
			total = total + 1
			escreva("Digite o nome: ")
			leia(nome[total])
			saldo[total] = 0.0
			escreva("Conta criada com sucesso!\n")
		}
		senao
		{
			escreva("Limite de contas atingido!\n")
		}
	}

	funcao vazio depositar()
	{
		cadeia busca = ""
		real valor = 0.0
		inteiro pos = 0

		escreva("Nome da conta: ")
		leia(busca)
		pos = buscarConta(busca)

		se(pos != 0)
		{
			escreva("Valor: ")
			leia(valor)
			se(valor > 0.0)
			{
				saldo[pos] = saldo[pos] + valor
				escreva("Deposito realizado!\n")
			}
			senao
			{
				escreva("Valor invalido!\n")
			}
		}
		senao
		{
			escreva("Conta nao encontrada!\n")
		}
	}

	funcao vazio sacar()
	{
		cadeia busca = ""
		real valor = 0.0
		inteiro pos = 0

		escreva("Nome da conta: ")
		leia(busca)
		pos = buscarConta(busca)

		se(pos != 0)
		{
			escreva("Valor: ")
			leia(valor)
			se((valor > 0.0) e (saldo[pos] >= valor))
			{
				saldo[pos] = saldo[pos] - valor
				escreva("Saque realizado!\n")
			}
			senao
			{
				escreva("Erro: saldo insuficiente ou valor invalido!\n")
			}
		}
		senao
		{
			escreva("Conta nao encontrada!\n")
		}
	}

	funcao vazio transferir()
	{
		cadeia origem = ""
		cadeia destino = ""
		real valor = 0.0
		inteiro pos1 = 0
		inteiro pos2 = 0

		escreva("Conta origem: ")
		leia(origem)
		escreva("Conta destino: ")
		leia(destino)

		pos1 = buscarConta(origem)
		pos2 = buscarConta(destino)

		se((pos1 != 0) e (pos2 != 0))
		{
			escreva("Valor: ")
			leia(valor)
			se((valor > 0.0) e (saldo[pos1] >= valor))
			{
				saldo[pos1] = saldo[pos1] - valor
				saldo[pos2] = saldo[pos2] + valor
				escreva("Transferencia realizada!\n")
			}
			senao
			{
				escreva("Erro: saldo insuficiente ou valor invalido!\n")
			}
		}
		senao
		{
			escreva("Conta invalida!\n")
		}
	}

	funcao vazio listar()
	{
		inteiro i = 0

		se(total == 0)
		{
			escreva("Nenhuma conta cadastrada!\n")
		}
		senao
		{
			para(i = 1; i <= total; i++)
			{
				escreva("----------------------------\n")
				escreva("Nome : ")
				escreva(nome[i])
				escreva("\n")
				escreva("Saldo: R$ ")
				escreva(saldo[i])
				escreva("\n")
			}
			escreva("----------------------------\n")
		}
	}

	funcao inicio()
	{
		faca
		{
			escreva("\n============================\n")
			escreva("       BANCO DIGITAL        \n")
			escreva("============================\n")
			escreva(" 1 - Criar Conta\n")
			escreva(" 2 - Depositar\n")
			escreva(" 3 - Sacar\n")
			escreva(" 4 - Transferir\n")
			escreva(" 5 - Listar Contas\n")
			escreva(" 0 - Sair\n")
			escreva("============================\n")
			escreva("Opcao: ")
			leia(opcao)

			escolha(opcao)
			{
				caso 1:
					criarConta()
					pare
				caso 2:
					depositar()
					pare
				caso 3:
					sacar()
					pare
				caso 4:
					transferir()
					pare
				caso 5:
					listar()
					pare
				caso 0:
					escreva("Encerrando. Ate logo!\n")
					pare
				caso contrario:
					escreva("Opcao invalida!\n")
					pare
			}
		} enquanto(opcao != 0)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3275; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */