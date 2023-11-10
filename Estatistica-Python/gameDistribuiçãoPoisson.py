from scipy.stats import poisson
import random

# Taxa média de eventos por unidade de tempo (por exemplo, eventos por hora)
taxa_media = 5

# Gera uma amostra da distribuição de Poisson para calcular o número de eventos esperados
eventos_esperados = poisson.mean(taxa_media)

print("Bem-vindo ao jogo de previsão de eventos!")
print(f"Você tem que prever quantos eventos ocorrerão em um determinado intervalo de tempo com uma taxa média de {taxa_media} eventos por unidade de tempo.")

# Pede ao jogador para fazer uma estimativa
try:
    estimativa = int(input("Quantos eventos você acha que ocorrerão? "))
except ValueError:
    print("Por favor, insira um número inteiro válido como sua estimativa.")
    exit(1)

# Realiza os eventos usando a distribuição de Poisson
num_eventos = random.randint(0, 100) 
print(f"O número real de eventos foi: {num_eventos}")

# Verifiqca a estimativa do jogador e informa o resultado
if estimativa == num_eventos:
    print("Você acertou! Parabéns!")
else:
    print(f"Você errou. O número real de eventos era em média {eventos_esperados:.2f}.")

# Calcula a probabilidade de acerto usando a distribuição de Poisson
prob_acerto = poisson.pmf(estimativa, taxa_media)
print(f"Qual é a probabilidade de acertar {estimativa} eventos por acaso? ({prob_acerto:.2%} de chance)")
