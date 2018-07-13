import random
# import matplotlib.pyplot as plt

suits = ['hearts', 'diamonds', 'spades', 'clubs']
value = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
cards = []
for item in suits:
    for number in value:
        cards.append([number, item])

score_1 = 0
score_2 = 0

with open("sevens_result.txt", "w") as myfile:
    myfile.write("Score of player 1    Score of player 2    Who won")

list_of_score_1 = []
list_of_score_2 = []

win1 = 0
win2 = 0

from player_7s import synergistic
def player1(computer_cards, dealt_cards):
    synergistic(computer_cards, dealt_cards)

def player2(computer_cards, dealt_cards):
    synergistic(computer_cards, dealt_cards)

i = 0
while (win2 <= 100) and (win1 <= 100) and (i <= 1000): #0):
    played_cards = []
    random.shuffle(cards)

    card_1_rem = list(cards[0:26])
    card_2_rem = list(cards[26:52])

    while len(card_1_rem) != 0 and len(card_2_rem) != 0:
        player1(card_1_rem, played_cards)
        player2(card_2_rem, played_cards)

    if len(card_1_rem) == 0:
        for item in card_2_rem:
            if item[0] == 13 or item[0] == 12 or item[0] == 11 or item[0] == 10:
                score_2 = score_2 + 10
            else:
                score_2 = score_2 + item[0]
        with open("sevens_result.txt", "a") as myfile:
            myfile.write("\n" + str(score_1) + "            " +
                         str(score_2) + "          Player 1 wins")

    elif len(card_2_rem) == 0:
        for item in card_1_rem:
            if item[0] == 13 or item[0] == 12 or item[0] == 11 or item[0] == 10:
                score_1 = score_1 + 10
            else:
                score_1 = score_1 + item[0]
        with open("sevens_result.txt", "a") as myfile:
            myfile.write("\n" + str(score_1) + "   " +
                         str(score_2) + "    Player 2 wins")

    if score_1 < score_2:
        win1 = win1 + 1
        win2 = 0
    elif score_2 > score_1:
        win2 = win2 + 1
        win1 = 0

    list_of_score_1.append(score_1)
    list_of_score_2.append(score_2)

    score_1 = 0
    score_2 = 0
    i = i + 1


final_score_1 = sum(list_of_score_1)
final_score_2 = sum(list_of_score_2)
if final_score_1 > final_score_2:
    print("Player 2 wins!")
    print("Score of player 1 is " + str(final_score_1))
    print("Score of player 2 is " + str(final_score_2))
elif final_score_1 < final_score_2:
    print("Player 1 wins!")
    print("Score of player 1 is " + str(final_score_1))
    print("Score of player 2 is " + str(final_score_2))

#plt.plot(list_of_score_1)
#plt.plot(list_of_score_2)
#plt.ylabel("Score")
#plt.savefig('final_graph.png')
