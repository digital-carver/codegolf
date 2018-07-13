

def tactical(cards_in_hand, played_cards):
    def list2dict(lst):
        d = {}
        for val, suit in lst:
            if suit in d:
                d[suit].append(val)
            else:
                d[suit] = [val]
        return d
    def play_card(card):
        cards_in_hand.remove(card)
        played_cards.append(card)

    hand = list2dict(cards_in_hand)
    if not played_cards:
        if 7 in hand['hearts']:
            play_card([7, 'hearts'])
        return (cards_in_hand, played_cards)
    table = list2dict(played_cards)

    playable_cards = {}
    for suit in hand:
        if suit not in table:
            if 7 in hand[suit]:
                # Do I hold the majority of the cards of this suit?
                suit_advantage = (len(hand[suit]) - 6.5)
                playable_cards[(7, suit)] = suit_advantage * 20
                if 6 in hand[suit] and 8 in hand[suit]:
                    # opponent can't immediately make use of this
                    playable_cards[(7, suit)] += 20
            continue

        visible = set(table[suit] + hand[suit])
        opp_hand = set(range(1,14)) - visible

        highcard = max(table[suit]) + 1
        if highcard in hand[suit]:
            advantage = sum(c > highcard for c in hand[suit]) - sum(c > highcard for c in opp_hand)
            playable_cards[(highcard, suit)] = advantage * 10
            if highcard + 1 in opp_hand:
                playable_cards[(highcard, suit)] -= 20

        lowcard = min(table[suit]) - 1
        if lowcard in hand[suit]:
            advantage = sum(c < lowcard for c in hand[suit]) - sum(c < lowcard for c in opp_hand)
            playable_cards[(lowcard, suit)] = advantage * 10
            if lowcard - 1 in opp_hand:
                playable_cards[(lowcard, suit)] -= 20

    if not playable_cards:
        return (cards_in_hand, played_cards)

    best_card = max(playable_cards, key=playable_cards.get)
    #print(hand, "\n", table, "\n", best_card, ":", playable_cards[best_card])
    play_card(list(best_card))

    return (cards_in_hand, played_cards)

def synergistic(cards_in_hand, played_cards):
    def list2dict(lst):
        d = {}
        for val, suit in lst:
            if suit in d:
                d[suit].append(val)
            else:
                d[suit] = [val]
        return d
    def play_card(card):
        cards_in_hand.remove(card)
        played_cards.append(card)

    hand = list2dict(cards_in_hand)
    if not played_cards:
        if 7 in hand['hearts']:
            play_card([7, 'hearts'])
        return (cards_in_hand, played_cards)
    table = list2dict(played_cards)

    playable_cards = {}
    for suit in hand:
        if 7 in hand[suit]:
            playable_cards[(7, suit)] = -1

        if suit not in table:
            continue
        visible = set(table[suit] + hand[suit])
        opp_hand = set(range(1,14)) - visible
        highcard = max(table[suit]) + 1

        if highcard in hand[suit]:
            if highcard+1 in opp_hand:
                playable_cards[(highcard, suit)] = 1
            else:
                playable_cards[(highcard, suit)] = 2

        lowcard = min(table[suit]) - 1
        if lowcard in hand[suit]:
            if lowcard - 1 in opp_hand:
                playable_cards[(lowcard, suit)] = 0
            else:
                playable_cards[(lowcard, suit)] = 1


    if not playable_cards:
        return (cards_in_hand, played_cards)

    best_card = list(max(playable_cards, key=playable_cards.get))
    print(hand, "\n", table, "\n", best_card)
    play_card(best_card)

    return (cards_in_hand, played_cards)

