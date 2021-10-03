#============実装内容===========
#   揃った場合
#     → 投入したコイン*2のポイントゲット
#     →　一律で１００コイン贈呈
#==============================

coin_left = 100
point = 0

loop {
  puts "---------------"
  puts "残りコイン数#{coin_left}"
  puts "ポイント#{point}"
  puts "何コイン入れますか"
  puts "1(10コイン) 2(30コイン) 3(50コイン) 4(やめとく)"
  puts "---------------"
  coin_in= gets.to_i

  coin =
  case coin_in
  when 1
    10
  when 2
    30
  when 3
    50
  when 4
    exit
  end
  
  if coin > coin_left
    puts "コインが足りません"
    puts "---------------"
    break
  end

  coin_left = coin_left - coin

  puts "エンターキーを3回押しましょう！"
  puts "---------------"

  #ランダムな数字をそれぞれの回の配列に入れる
  def slot_prepare(slot)
    while slot.size < 3
      slot << rand(1..9)
    end
  end

  slot_prepare(slot1 = [])
  slot_prepare(slot2 = [])
  slot_prepare(slot3 = [])

  #1回目
  puts "|#{slot1[0]}|||"
  puts "|#{slot1[1]}|||"
  puts "|#{slot1[2]}|||"
  enter = gets
  puts "---------------"

  #2回目
  puts "|#{slot1[0]}|#{slot2[0]}||"
  puts "|#{slot1[1]}|#{slot2[1]}||"
  puts "|#{slot1[2]}|#{slot2[2]}||"
  enter = gets
  puts "---------------"

  #3回目
  puts "|#{slot1[0]}|#{slot2[0]}|#{slot3[0]}|"
  puts "|#{slot1[1]}|#{slot2[1]}|#{slot3[1]}|"
  puts "|#{slot1[2]}|#{slot2[2]}|#{slot3[2]}|"
  enter = gets
  puts "----------------"

  #数字揃った時
  get_point = coin * 2

  if slot1[0]==slot1[1] && slot1[0]==slot1[2]
    puts "左に#{slot1[0]}が揃いました!"
    puts "#{get_point}ポイント獲得！"
    puts "100コイン獲得！"
    coin_left = coin_left + 100
    point = point + get_point
  elsif slot2[0]==slot2[1] && slot2[0]==slot2[2]
    puts "真ん中に#{slot2[0]}が揃いました!"
    puts "#{get_point}ポイント獲得！"
    puts "100コイン獲得！"
    coin_left = coin_left + 100
  elsif slot3[0]==slot3[1] && slot3[0]==slot3[2]
    puts "右に#{slot3[0]}が揃いました!"
    puts "#{get_point}ポイント獲得！"
    puts "100コイン獲得！"
    coin_left = coin_left + 100
  end

  if coin_left <= 0
    puts "コインが足りなくなりました"
    puts "----------------"
    break
  end
}
