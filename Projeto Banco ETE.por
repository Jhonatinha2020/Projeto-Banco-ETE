programa
{
	inclua biblioteca Util --> u
	funcao inicio()
	{
	
//Declaração do teste lógico
		logico teste = verdadeiro	
		logico definido = falso
		
//Declaração das variáveis
		inteiro contaC=0, contaP=0, ag, digVeCc=0, digVeCp=1, primeiroDeposito
		real digitado, saldoCc = 0.0, saldoCp = 0.0, depositoCc, depositoCp, saqueCc, saqueCp, transferencia
		faca{
			
//looping principal menu
			inteiro menu
			cadeia nomeUsuario
			
        escreva("=================================\n")
        escreva("| Bem vindo ao Banco ETE\t|\n")
        escreva("|\t\t\t\t|\n")       
        escreva("| Selecione uma opção:\t\t|\n") 
        escreva("|\t\t\t\t|\n")
        escreva("| 1. Criar uma conta\t\t|\n")
        escreva("| 2. Saldo\t\t\t|\n")
        escreva("| 3. Depósito em conta corrente\t|\n")
        escreva("| 4. Saque em conta corrente\t|\n")
        escreva("| 5. Tranferência para poupança\t|\n")
        escreva("| 6. Transferência para corrente|\n")
        escreva("| 7. Saque em conta poupança\t|\n")
        escreva("| 8. Exibir suas contas\t        |\n")
        escreva("| 0. Sair\t\t\t|\n")
        escreva("=================================\n")
        leia (menu)

 		escolha(menu){
				
//Processo de criação das contas
			caso 1:
				escreva("Digite seu nome: ")
				leia(nomeUsuario)
				definido = verdadeiro
				ag = u.sorteia(1, 99)
				contaC = u.sorteia(100, 999)
				contaP = u.sorteia(100, 999)

//Para que as contas não tenham o mesmo numero
				faca{
					contaP = u.sorteia(100, 999)	
				}enquanto(contaP == contaC)

//Usuario consegue ver suas contas já criadas
				escreva("\nSeja bem vindo ao Banco ETE: " + nomeUsuario + "\n")
				escreva("O numero da sua agência é : " + ag + "\n")
				escreva("O numero da sua conta corrente é a: " + contaC + "-" + digVeCc + "\n")
				escreva("O numero da sua conta poupança é a: " + contaP + "-" + digVeCp + "\n")
	
//Primeiro deposito
				escreva("\nVocê deseja fazer um depósito inicial? 1: Sim, 2: Não: ")
				leia(primeiroDeposito)
				
//Processo dependente da resposta do usuário
				escolha(primeiroDeposito){
				caso 1:
					escreva("\nQual o valor do depósito: R$")
					leia(saldoCc)
				
					escreva("Seu saldo atual é R$: " + saldoCc +"\n" + "Conta corrente: R$" + saldoCc + "\nConta poupança: R$" + saldoCp + "\n")
				pare
				caso 2:
					escreva("Por gentileza, escolha uma opção de menu \n\n")
				pare
				}
			pare
			
//Opção de mostrar o saldo das contas em tela
			caso 2:
//Verificação de existe o usuário está autenticado
				se(definido == verdadeiro){
					escreva("Esse é seu saldo atual da Conta corrente é: R$" + saldoCc + "\n")
					escreva("Esse é seu saldo atual da Conta poupança é: R$" + saldoCp + "\n")
				}senao{
					escreva("Error! É necessario criar uma conta, antes de realizar qualquer operação!\n")	
				}
				
			pare

//Opção de depósito em conta corrente
			caso 3:
//Verificação de existe o usuário está autenticado
				se(definido == verdadeiro){
					escreva("Qual o valor de depósito: R$")
					leia(depositoCc)
	
//Lógica para o depósito na conta
					saldoCc = saldoCc + depositoCc
					depositoCc = 0.0
	
					escreva("Operação realizada com sucesso\n\n")
					escreva("Seu novo saldo é: R$" + saldoCc + "\n")
				}senao{
					escreva("Error! É necessario criar uma conta, antes de realizar qualquer operação!\n")	
				}
					
			pare

//Opção de saque na conta corrente
			caso 4:
//Verificação de existe o usuário está autenticado
				se(definido == verdadeiro){
					escreva("Digite o valor que você deseja sacar: R$")
					leia(saqueCc)
	
//Lógica para garantir que o saque não será maior que o saldo atual na cc
					se(saqueCc > saldoCc){
						escreva("Você não possui saldo suficiente para o saque!\n")
					} senao{
						saldoCc = saldoCc - saqueCc
						saqueCc = 0.0
						escreva("Operação realizada com sucesso\n\n")
						escreva("Seu novo saldo é de: R$" + saldoCc + "\n")
					}
				}senao{
					escreva("Error! É necessario criar uma conta, antes de realizar qualquer operação!\n")	
				}
			pare

//Opção de aplicação na conta poupança
			caso 5:
//Verificação de existe o usuário está autenticado
				se(definido == verdadeiro){
					escreva("Digite o valor que você deseja transferir para a conta poupança: R$")
					leia(depositoCp)
	
//Lógica para garantir que a aplicação não será maior que o saldo atual na cc
					se(depositoCp > saldoCc){
						escreva("Saldo insuficiente para realizar esta operação!\n")
					}senao {
						saldoCc = saldoCc - depositoCp
						saldoCp = saldoCp + depositoCp
						depositoCp = 0.0
						escreva("Operação bem sucedida!\n\n")
						escreva("Seu saldo na Conta corrente é de: R$" + saldoCc + "\n")
						escreva("Seu saldo na Conta poupança é de: R$" + saldoCp + "\n")
					}
				}senao{
					escreva("Error! É necessario criar uma conta, antes de realizar qualquer operação!\n")	
				}
			pare

//Resgate da conta poupança
			caso 6:
//Validando o usuário 
				se(definido == verdadeiro){
					escreva("Digite o valor que você deseja transferir para a conta corrente: R$")
					leia(saqueCp)
	
//Processamento para que seja valido o saque apenas com o saldo suficiente
					se(saqueCp > saldoCp){
						escreva("Saldo insuficiente para realizar esta operação!\n")
					}senao {
						saldoCp = saldoCp - saqueCp
						saldoCc = saldoCc + saqueCp
						saqueCp = 0.0
						escreva("Operação bem sucedida!\n\n")
						escreva("Seu saldo na Conta corrente é de: R$" + saldoCc + "\n")
						escreva("Seu saldo na Conta poupança é de: R$" + saldoCp + "\n")
					}
				}senao{
					escreva("Error! É necessario criar uma conta, antes de realizar qualquer operação!\n")	
				}
			pare
			
// Fazendo uma opão de resgate da conta poupança:

			caso 7:
			se(definido == verdadeiro){
				escreva("Digite o valor que você deseja resgatar da sua conta poupança:")
				leia(saqueCp)
				// resgate tem que ser maior que valor ja lá
 				se(saqueCp > saldoCp){
 					escreva("Saldo insuficiente para realizar essa operação\n")
 					}
 					senao{
 						saldoCp= saldoCp - saqueCp
 						escreva("Operação bem sucedida!\n\n")
 						escreva("Seu saldo na Conta corrente é de: R$" + saldoCc + "\n")
						escreva("Seu saldo na Conta poupança é de: R$" + saldoCp + "\n")
 						
 					}
				
			}senao{
					escreva("Error! É necessario criar uma conta, antes de realizar qualquer operação!\n")	
				}
			pare

//Opção que exibi o número das contas
			caso 8:
				se(definido == verdadeiro){
					escreva("\n\nSuas contas são:\n")
					escreva("Conta corrente: " + contaC + "-" + digVeCc + "\n")
					escreva("Conta poupança: " + contaP + "-" + digVeCp + "\n\n")	
				}senao{
					escreva("Error! É necessario criar uma conta, antes de realizar qualquer operação!\n")	
				}
			pare

			

//Opção 0 finalizando do programa
			caso 0:
				escreva("Agradecemos por utilizar o Banco ETE, volte sempre!\n\n")
				
//Alterando a variavel finalizando o looping
				teste = falso
			pare
			caso contrario:
				escreva("\n\nErro, por gentileza, selecione um opção que esteja no menu\n\n")
			}
			
		}enquanto(teste == verdadeiro)


        
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5059; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */