import numpy as np
from scipy.stats import bernoulli, binom

# Parâmetros da distribuição de Bernoulli
p = 0.5  # Probabilidade de sucesso

# Número de rodadas no jogo
num_rodadas = 5
pontuacao = 0

print("Bem-vindo ao jogo de adivinhação!")
print(f"Você tem {num_rodadas} rodadas para adivinhar o resultado de uma distribuição de Bernoulli (1 ou 0).")

for rodada in range(num_rodadas):
    # Gera uma amostra de distribuição de Bernoulli
    resultado_real = bernoulli.rvs(p, size=1)[0]

    # Pede ao jogador para adivinhar
    palpite = input(f"Rodada {rodada + 1}: Adivinhe 0 ou 1: ")

    try:
        palpite = int(palpite)
        if palpite != 0 and palpite != 1:
            print("Insira 0 ou 1 como seu palpite.")
            continue
    except ValueError:
        print("Insira 0 ou 1 como seu palpite.")
        continue

    if palpite == resultado_real:
        print("Você acertou!")
        pontuacao += 1
    else:
        print(f"Você errou. O resultado real era {resultado_real}.")

print(f"Jogo encerrado. Sua pontuação final é {pontuacao} pontos.")

# Calcula a pontuação final usando uma distribuição binomial
n = num_rodadas  # Número de tentativas
p_acerto = p  # Probabilidade de acerto em cada tentativa
pontuacao_final = binom.pmf(pontuacao, n, p_acerto)
print(f"Sua pontuação final é estatisticamente significativa? ({pontuacao_final:.2%} de chance de obtê-la por acaso)")

