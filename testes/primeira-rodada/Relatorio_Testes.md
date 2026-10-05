# Legiões do Eclipse — primeira rodada de testes

Data: 05/10/2026. Base: V2.5 MATERIAIS ANIMADOS.

## Resultado

33 cenários executados: 31 aprovados e 2 falhas reproduzidas. O HTML original não foi modificado.

Método: execução do JavaScript original em Node VM com DOM simulado. Funções internas expostas apenas em memória para montar cenários e inspecionar estado. Os testes não equivalem a uma sessão de navegador, Electron ou Android.

## Falhas reproduzidas

1. **Alta prioridade — entrada direta pela aba Arena.** Iniciar tabuleiro e clicar na aba Arena chama `setMode`/`refreshPanel` com os objetos criados em `resetArena` ainda sem `kind` e demais atributos. A execução lança `Cannot read properties of undefined (reading 'icon')`. Recomenda-se encaminhar a aba para a seleção de treino e configurar ambos os combatentes antes da mudança de modo. Confirmar também visualmente em navegador.
2. **Prioridade média — colisão no centro exato.** Um corpo de raio 24 em (400,260), coincidente com o centro do obstáculo de raio 48, permanece sobreposto após `circleResolve`. A condição `d>0.001` ignora esse caso. Recomenda-se uma direção determinística de separação quando a distância for zero. Cenário sintético: ainda não foi demonstrado que o controle normal coloque o personagem nessa posição.

## Limites e próximos testes

- Os 16 especiais foram verificados quanto a ativação, gasto de stamina, recarga e ausência de valores inválidos por meio segundo de simulação. Isso não valida todo o dano, duração, alcance ou balanceamento.
- Treino, vitória, derrota e empate passaram nos cenários listados abaixo.
- Captura de orbe foi testada invocando a chegada diretamente; falta percorrer uma partida completa até o orbe.
- Faltam renderização, carregamento de sprites, mouse/teclado reais, redimensionamento, quedas de FPS, sessão prolongada, Electron e Android.
- Próxima sequência: corrigir a entrada pela aba Arena; corrigir colisão coincidente; repetir estes casos; executar uma partida visual completa e testes de controles.

## Reprodução

Com Node instalado, executar `node testar.cjs /caminho/Legioes_do_Eclipse_v2_5_MATERIAIS_ANIMADOS.html`. O programa imprime resultados JSON. A lista inclui falhas esperadas na base atual; o código de saída não representa aprovação.

## Cenários

| Cenário | Resultado |
|---|---|
| Inicialização: 8 unidades e atributos finitos | PASS |
| Turnos: alternância e incremento de rodada | PASS |
| Reposição de movimento ao iniciar turno | PASS |
| Cronômetro expira e troca turno | PASS |
| Modal pausa cronômetro e bloqueia encerrar turno | PASS |
| Movimento: custo, destino e bloqueio de turno durante animação | PASS |
| Rotas: custo dentro do orçamento e passos ortogonais | PASS |
| Entrada de duelo preserva vida da unidade | PASS |
| Vitória remove adversário e preserva vida do vencedor | PASS |
| Derrota remove criatura do jogador | PASS |
| Empate conserva unidades e posições | PASS |
| Duelo encerra aos 120 segundos | PASS |
| Treino preserva estado do tabuleiro | PASS |
| Captura do orbe encerra partida | PASS |
| Colisão desloca corpo sobreposto fora do centro | PASS |
| Colisão resolve corpo exatamente no centro do obstáculo | FAIL |
| Entrada pela aba Arena permite atualizar combate | FAIL |
| Especial berserker: custo, recarga e estado finito | PASS |
| Especial orc: custo, recarga e estado finito | PASS |
| Especial thief: custo, recarga e estado finito | PASS |
| Especial templar: custo, recarga e estado finito | PASS |
| Especial troll: custo, recarga e estado finito | PASS |
| Especial illusionist: custo, recarga e estado finito | PASS |
| Especial phantom: custo, recarga e estado finito | PASS |
| Especial wraith: custo, recarga e estado finito | PASS |
| Especial water: custo, recarga e estado finito | PASS |
| Especial wizard: custo, recarga e estado finito | PASS |
| Especial fire: custo, recarga e estado finito | PASS |
| Especial seer: custo, recarga e estado finito | PASS |
| Especial shifter: custo, recarga e estado finito | PASS |
| Especial vampire: custo, recarga e estado finito | PASS |
| Especial demon: custo, recarga e estado finito | PASS |
| Especial conjurer: custo, recarga e estado finito | PASS |

SHA-256 da base: `44b4547c11bc8f67101da9f2d21fad17b6b8a01cfd197c914ddba3f386d902d8`
