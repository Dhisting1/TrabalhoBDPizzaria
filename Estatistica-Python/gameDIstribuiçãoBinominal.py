import random
from scipy.stats import binom

# Número de lançamentos da moeda
num_lancamentos = 10

# Probabilidade de obter "cara" em um lançamento
p = .5

# Gera uma amostra da distribuição binomial para calcular o número de "caras" esperadas
num_caras_esperadas = binom.mean(num_lancamentos, p)

print("Bem-vindo ao jogo da moeda!")
print(f"Você tem que adivinhar quantas vezes a moeda cairá com a face 'cara' em {num_lancamentos} lançamentos.")

# Peça ao jogador pra chutar quantas vezes a moeda cairá com "Cara"
try:
    estimativa = int(input("Quantas vezes acha que a moeda cairá com a face 'cara'? "))
except ValueError:
    print("Por favor, insira um número inteiro válido como sua estimativa.")
    exit(1)

# Realiza os lançamentos da moeda
num_caras = sum(random.choice([0, 1]) for _ in range(num_lancamentos))

print(f"A moeda caiu com a face 'cara' {num_caras} vezes.")

# Verifica a estimativa do jogador e informa o resultado
if estimativa == num_caras:
    print("Você acertou! Parabéns!")
else:
    print(f"Você errou. O número real de 'caras' era {num_caras_esperadas:.0f}.")

# Calcula a probabilidade de acerto usando a distribuição binomial
prob_acerto = binom.pmf(estimativa, num_lancamentos, p)
print(f"Qual é a probabilidade de acertar {estimativa} vezes por acaso? ({prob_acerto:.2%} de chance)")
