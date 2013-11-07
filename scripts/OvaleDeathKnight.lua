local _, Ovale = ...
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "Ovale"
	local desc = "[5.2] Ovale: Frost, Unholy"
	local code = [[
Define(army_of_the_dead 42650)
  SpellInfo(army_of_the_dead duration=4 frost=1 blood=1 unholy=1 runicpower=-300 cd=600 )
  SpellAddBuff(army_of_the_dead army_of_the_dead=1)
Define(blood_charge 114851)
  SpellInfo(blood_charge duration=25 )
  SpellAddBuff(blood_charge blood_charge=1)
Define(blood_fury 20572)
  SpellInfo(blood_fury duration=15 cd=120 )
  SpellAddBuff(blood_fury blood_fury=1)
Define(blood_plague 55078)
  SpellInfo(blood_plague duration=30 tick=3 )
  SpellAddTargetDebuff(blood_plague blood_plague=1)
Define(blood_tap 45529)
Define(dark_transformation 63560)
  SpellInfo(dark_transformation duration=30 unholy=1 runicpower=-100 )
  SpellAddBuff(dark_transformation dark_transformation=1)
Define(death_and_decay 43265)
  SpellInfo(death_and_decay duration=10 unholy=1 runicpower=-100 cd=30 )
  SpellAddBuff(death_and_decay death_and_decay=1)
Define(death_coil 47541)
  SpellInfo(death_coil runicpower=400 )
Define(empower_rune_weapon 47568)
  SpellInfo(empower_rune_weapon runicpower=-250 cd=300 )
Define(festering_strike 85948)
  SpellInfo(festering_strike frost=1 blood=1 runicpower=-200 )
Define(frost_fever 55095)
  SpellInfo(frost_fever duration=30 tick=3 )
  SpellAddTargetDebuff(frost_fever frost_fever=1)
Define(frost_presence 48266)
  SpellAddBuff(frost_presence frost_presence=1)
Define(frost_strike 49143)
  SpellInfo(frost_strike runicpower=350 )
Define(golems_strength 79634)
  SpellInfo(golems_strength duration=25 cd=1 )
  SpellAddBuff(golems_strength golems_strength=1)
Define(horn_of_winter 57330)
  SpellInfo(horn_of_winter duration=300 runicpower=-100 cd=20 )
  SpellAddBuff(horn_of_winter horn_of_winter=1)
Define(howling_blast 49184)
  SpellInfo(howling_blast frost=1 runicpower=-100 )
Define(killing_machine 51128)
Define(mogu_power_potion_aura 105706)
  SpellInfo(mogu_power_potion_aura duration=25 cd=1 )
  SpellAddBuff(mogu_power_potion_aura mogu_power_potion_aura=1)
Define(obliterate 49020)
  SpellInfo(obliterate frost=1 unholy=1 runicpower=-200 )
Define(outbreak 77575)
  SpellInfo(outbreak runicpower=0 cd=60 )
Define(pillar_of_frost 51271)
  SpellInfo(pillar_of_frost duration=20 frost=1 runicpower=-100 cd=60 )
  SpellAddBuff(pillar_of_frost pillar_of_frost=1)
Define(plague_leech 123693)
  SpellInfo(plague_leech cd=25 )
Define(plague_strike 45462)
  SpellInfo(plague_strike unholy=1 runicpower=-100 )
Define(raise_dead 46584)
  SpellInfo(raise_dead cd=120 )
  SpellAddBuff(raise_dead raise_dead=1)
Define(rime 59057)
Define(runic_corruption 51460)
  SpellInfo(runic_corruption duration=3 )
  SpellAddBuff(runic_corruption runic_corruption=1)
Define(scourge_strike 55090)
  SpellInfo(scourge_strike unholy=1 runicpower=-100 )
Define(shadow_infusion 49572)
Define(soul_reaper 114866)
  SpellInfo(soul_reaper duration=5 blood=1 runicpower=-100 cd=6 )
  SpellAddBuff(soul_reaper soul_reaper=1)
Define(sudden_doom 49530)
Define(summon_gargoyle 49206)
  SpellInfo(summon_gargoyle duration=40 cd=180 )
  SpellAddBuff(summon_gargoyle summon_gargoyle=1)
Define(unholy_blight 115989)
  SpellInfo(unholy_blight duration=10 cd=90 )
  SpellAddBuff(unholy_blight unholy_blight=1)
Define(unholy_frenzy 49016)
  SpellInfo(unholy_frenzy duration=30 cd=180 )
  SpellAddBuff(unholy_frenzy unholy_frenzy=1)
Define(unholy_presence 48265)
  SpellAddBuff(unholy_presence unholy_presence=1)
Define(blood_tap_talent 13)
Define(plague_leech_talent 2)
Define(runic_corruption_talent 15)
Define(runic_empowerment_talent 14)
Define(unholy_blight_talent 3)
AddIcon mastery=2 help=main
{
	if not InCombat() 
	{
		unless Stance(2) Spell(frost_presence)
		Spell(horn_of_winter)
	}
	if BuffStacks(killing_machine) or RunicPower() >88 Spell(frost_strike)
	if TalentPoints(plague_leech_talent) and {target.DebuffRemains(blood_plague) <3 or target.DebuffRemains(frost_fever) <3 or SpellCooldown(outbreak) <1 } Spell(plague_leech)
	if target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 Spell(outbreak)
	if target.HealthPercent() -{3 *target.HealthPercent() /target.DeadIn() } <=35 Spell(soul_reaper)
	if not target.DebuffPresent(frost_fever) Spell(howling_blast)
	if not target.DebuffPresent(blood_plague) Spell(plague_strike)
	if BuffStacks(rime) Spell(howling_blast)
	if RunicPower() >76 Spell(frost_strike)
	if RuneCount(unholy) >1 Spell(obliterate)
	if RuneCount(death) >1 or RuneCount(frost) >1 Spell(howling_blast)
	Spell(horn_of_winter)
	if RuneCount(unholy) >0 Spell(obliterate)
	Spell(howling_blast)
	if TalentPoints(runic_empowerment_talent) and {RuneCount(frost) ==0 or RuneCount(blood) ==0 } Spell(frost_strike)
	if TalentPoints(runic_corruption_talent) and BuffExpires(runic_corruption) Spell(frost_strike)
	Spell(death_and_decay)
	if RunicPower() >=40 Spell(frost_strike)
}
AddIcon mastery=2 help=offgcd
{
	if not InCombat() 
	{
		Spell(pillar_of_frost)
	}
	Spell(pillar_of_frost)
	if TalentPoints(blood_tap_talent) and BuffStacks(blood_charge) >10 and {RunicPower() >76 or {RunicPower() >=20 and BuffStacks(killing_machine) } } Spell(blood_tap)
	if TalentPoints(blood_tap_talent) and {target.HealthPercent() -{3 *target.HealthPercent() /target.DeadIn() } <=35 and SpellCooldown(soul_reaper) ==0 } Spell(blood_tap)
	if TalentPoints(blood_tap_talent) and {target.HealthPercent() -{3 *target.HealthPercent() /target.DeadIn() } >35 or BuffStacks(blood_charge) >=8 } Spell(blood_tap)
}
AddIcon mastery=2 help=cd
{
	if not InCombat() 
	{
		Spell(army_of_the_dead)
		Spell(blood_fury)
		Spell(raise_dead)
	}
	if target.DeadIn() <=60 and {BuffPresent(mogu_power_potion_aura) or BuffPresent(golems_strength) } Spell(empower_rune_weapon)
	if BuffPresent(pillar_of_frost)  { Item(Trinket0Slot usable=1) Item(Trinket1Slot usable=1) } 
	Spell(blood_fury)
	Spell(raise_dead)
	if TalentPoints(unholy_blight_talent) and {target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 } Spell(unholy_blight)
	Spell(empower_rune_weapon)
}
AddIcon mastery=3 help=main
{
	if not InCombat() 
	{
		unless Stance(3) Spell(unholy_presence)
		Spell(horn_of_winter)
	}
	if AttackPower() >{LastSpellAttackPower(blood_plague) +5000 } and TimeInCombat() >15 and not {SpellCooldown(unholy_blight) >49 } Spell(outbreak)
	if AttackPower() >{LastSpellAttackPower(blood_plague) +5000 } and TimeInCombat() >15 and not {SpellCooldown(unholy_blight) >49 } Spell(plague_strike)
	if target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 Spell(outbreak)
	if target.HealthPercent() -{3 *target.HealthPercent() /target.DeadIn() } <=35 Spell(soul_reaper)
	if not target.DebuffPresent(blood_plague) or not target.DebuffPresent(frost_fever) Spell(plague_strike)
	Spell(dark_transformation)
	if RunicPower() >90 Spell(death_coil)
	if RuneCount(unholy) ==2 Spell(death_and_decay)
	if RuneCount(unholy) ==2 Spell(scourge_strike)
	if RuneCount(blood) ==2 and RuneCount(frost) ==2 Spell(festering_strike)
	Spell(death_and_decay)
	if BuffStacks(sudden_doom) or {BuffExpires(dark_transformation) and RuneCount(unholy) <=1 } Spell(death_coil)
	Spell(scourge_strike)
	if TalentPoints(plague_leech_talent) and SpellCooldown(outbreak) <1 Spell(plague_leech)
	Spell(festering_strike)
	Spell(horn_of_winter)
	if BuffExpires(dark_transformation) or {SpellCooldown(summon_gargoyle) >8 and BuffRemains(dark_transformation) >8 } Spell(death_coil)
}
AddIcon mastery=3 help=offgcd
{
	if TalentPoints(blood_tap_talent) and BuffStacks(blood_charge) >10 and RunicPower() >=32 Spell(blood_tap)
	if TalentPoints(blood_tap_talent) and {target.HealthPercent() -{3 *target.HealthPercent() /target.DeadIn() } <=35 and SpellCooldown(soul_reaper) ==0 } Spell(blood_tap)
	if TalentPoints(blood_tap_talent) and BuffStacks(shadow_infusion) ==5 Spell(blood_tap)
	if TalentPoints(blood_tap_talent) and RuneCount(unholy) ==2 and SpellCooldown(death_and_decay) ==0 Spell(blood_tap)
	if TalentPoints(blood_tap_talent) and SpellCooldown(death_and_decay) ==0 Spell(blood_tap)
	if TalentPoints(blood_tap_talent) and BuffStacks(blood_charge) >=8 Spell(blood_tap)
}
AddIcon mastery=3 help=cd
{
	if not InCombat() 
	{
		Spell(army_of_the_dead)
		Spell(blood_fury)
		Spell(raise_dead)
	}
	if TimeInCombat() >=2 Spell(blood_fury)
	if TimeInCombat() >=4 Spell(unholy_frenzy)
	if TimeInCombat() >=4  { Item(Trinket0Slot usable=1) Item(Trinket1Slot usable=1) } 
	if TalentPoints(unholy_blight_talent) and {target.DebuffRemains(frost_fever) <3 or target.DebuffRemains(blood_plague) <3 } Spell(unholy_blight)
	Spell(summon_gargoyle)
	Spell(empower_rune_weapon)
}
]]

	OvaleScripts:RegisterScript("DEATHKNIGHT", name, desc, code)
end