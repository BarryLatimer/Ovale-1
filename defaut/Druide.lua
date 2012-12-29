Ovale.defaut["DRUID"] = [[Define(berserk 50334)
  SpellInfo(berserk duration=10 cd=180 )
  SpellAddBuff(berserk berserk=1)
Define(berserking 26297)
  SpellInfo(berserking duration=10 cd=180 )
  SpellAddBuff(berserking berserking=1)
Define(cat_form 768)
  SpellAddBuff(cat_form cat_form=1)
Define(celestial_alignment 112071)
  SpellInfo(celestial_alignment duration=15 cd=180 )
  SpellAddBuff(celestial_alignment celestial_alignment=1)
Define(chosen_of_elune 122114)
Define(dream_of_cenarius_damage 108381)
  SpellInfo(dream_of_cenarius_damage duration=30 )
  SpellAddBuff(dream_of_cenarius_damage dream_of_cenarius_damage=1)
Define(faerie_fire 770)
  SpellInfo(faerie_fire duration=300 )
  SpellAddBuff(faerie_fire faerie_fire=1)
  AddCheckBox(faerie_fire_check SpellName(faerie_fire))
Define(ferocious_bite 22568)
  SpellInfo(ferocious_bite combo=0 energy=25 )
Define(healing_touch 5185)
Define(heart_of_the_wild 108288)
  SpellInfo(heart_of_the_wild duration=45 cd=360 )
Define(hurricane 16914)
  SpellInfo(hurricane duration=10 )
  SpellAddBuff(hurricane hurricane=1)
Define(incarnation 106731)
  SpellInfo(incarnation duration=30 cd=180 )
Define(lunar_eclipse 48518)
  SpellAddBuff(lunar_eclipse lunar_eclipse=1)
Define(mark_of_the_wild 1126)
  SpellInfo(mark_of_the_wild duration=3600 )
  SpellAddBuff(mark_of_the_wild mark_of_the_wild=1)
Define(moonfire 8921)
  SpellInfo(moonfire duration=14 tick=2 )
  SpellAddTargetDebuff(moonfire moonfire=1)
Define(moonkin_form 24858)
  SpellAddBuff(moonkin_form moonkin_form=1)
Define(natures_grace 16886)
  SpellInfo(natures_grace duration=15 )
  SpellAddBuff(natures_grace natures_grace=1)
Define(natures_swiftness 132158)
  SpellInfo(natures_swiftness cd=60 )
  SpellAddBuff(natures_swiftness natures_swiftness=1)
Define(natures_vigil 124974)
  SpellInfo(natures_vigil duration=30 cd=180 )
  SpellAddBuff(natures_vigil natures_vigil=1)
Define(omen_of_clarity 16864)
  SpellAddBuff(omen_of_clarity omen_of_clarity=1)
Define(predatory_swiftness 16974)
Define(rake 1822)
  SpellInfo(rake duration=15 energy=35 tick=3 combo=1 )
  SpellAddTargetDebuff(rake rake=1)
Define(ravage 6785)
  SpellInfo(ravage energy=45 combo=1 )
Define(rip 1079)
  SpellInfo(rip duration=16 combo=0 energy=30 tick=2 )
  SpellAddTargetDebuff(rip rip=1)
Define(savage_roar 52610)
  SpellInfo(savage_roar duration=12 combo=0 energy=25 )
  SpellAddBuff(savage_roar savage_roar=1)
Define(shooting_stars 93399)
Define(shred 5221)
  SpellInfo(shred energy=40 combo=1 )
Define(skull_bash_cat 80965)
  SpellInfo(skull_bash_cat cd=15 )
Define(solar_eclipse 48517)
  SpellAddBuff(solar_eclipse solar_eclipse=1)
Define(starfall 48505)
  SpellInfo(starfall duration=10 cd=90 )
  SpellAddBuff(starfall starfall=1)
Define(starfire 2912)
Define(starsurge 78674)
  SpellInfo(starsurge cd=15 )
Define(sunfire 93402)
  SpellInfo(sunfire duration=14 tick=2 )
  SpellAddTargetDebuff(sunfire sunfire=1)
Define(thrash 106832)
Define(thrash 77758)
  SpellInfo(thrash duration=16 tick=2 cd=6 )
  SpellAddTargetDebuff(thrash thrash=1)
Define(tigers_fury 5217)
  SpellInfo(tigers_fury duration=6 energy=-60 cd=30 )
  SpellAddBuff(tigers_fury tigers_fury=1)
Define(treants 106737)
  SpellInfo(treants duration=15 cd=60 )
Define(virmens_bite 105697)
  SpellInfo(virmens_bite duration=25 cd=1 )
  SpellAddBuff(virmens_bite virmens_bite=1)
Define(weakened_armor 113746)
  SpellInfo(weakened_armor duration=30 )
  SpellAddBuff(weakened_armor weakened_armor=1)
Define(wild_mushroom 88747)
  SpellInfo(wild_mushroom duration=300 )
Define(wild_mushroom_detonate 78777)
Define(wrath 5176)
Define(dream_of_cenarius_talent 17)
Define(force_of_nature_talent 12)
Define(heart_of_the_wild_talent 16)
Define(incarnation_talent 11)
Define(natures_swiftness_talent 4)
Define(natures_vigil_talent 18)
Define(soul_of_the_forest_talent 10)
AddIcon mastery=1 help=main
{
	if not InCombat() 
	{
		if not BuffPresent(str_agi_int any=1) Spell(mark_of_the_wild)
		if not BuffPresent(dream_of_cenarius_damage) and TalentPoints(dream_of_cenarius_talent) Spell(healing_touch)
		unless Stance(5) Spell(moonkin_form)
	}
	if TalentPoints(force_of_nature_talent) Spell(treants)
	if TalentPoints(dream_of_cenarius_talent) and not BuffPresent(dream_of_cenarius_damage) and ManaPercent() >25 Spell(healing_touch)
	if BuffPresent(lunar_eclipse) and {target.DebuffRemains(moonfire) <{BuffRemains(natures_grace) -2 +2 *ArmorSetParts(T14 more 4) } } Spell(moonfire)
	if BuffPresent(solar_eclipse) and {target.DebuffRemains(sunfire) <{BuffRemains(natures_grace) -2 +2 *ArmorSetParts(T14 more 4) } } Spell(sunfire)
	if {target.DebuffRemains(moonfire) <{BuffRemains(natures_grace) -2 +2 *ArmorSetParts(T14 more 4) } } Spell(moonfire)
	if {target.DebuffRemains(sunfire) <{BuffRemains(natures_grace) -2 +2 *ArmorSetParts(T14 more 4) } } Spell(sunfire)
	if BuffPresent(lunar_eclipse) and target.TicksRemain(moonfire) <2 Spell(moonfire)
	if BuffPresent(solar_eclipse) and target.TicksRemain(sunfire) <2 Spell(sunfire)
	if SpellCooldown(starsurge) Spell(starsurge)
	if BuffPresent(celestial_alignment) and CastTime(starfire) <BuffRemains(celestial_alignment) Spell(starfire)
	if BuffPresent(celestial_alignment) and CastTime(wrath) <BuffRemains(celestial_alignment) Spell(wrath)
	if EclipseDir() ==1 or {EclipseDir() ==0 and Eclipse() >0 } Spell(starfire)
	if EclipseDir() ==0-1 or {EclipseDir() ==0 and Eclipse() <=0 } Spell(wrath)
}
AddIcon mastery=1 help=offgcd
{
	if BuffStacks(wild_mushroom) >0 and BuffPresent(solar_eclipse) Spell(wild_mushroom_detonate)
	if TalentPoints(natures_swiftness_talent) and TalentPoints(dream_of_cenarius_talent) Spell(natures_swiftness)
}
AddIcon mastery=1 help=moving
{
	if target.TicksRemain(moonfire) <2 Spell(moonfire)
	if target.TicksRemain(sunfire) <2 Spell(sunfire)
	if BuffStacks(wild_mushroom) <5 Spell(wild_mushroom)
	if BuffStacks(shooting_stars) Spell(starsurge)
	if BuffPresent(lunar_eclipse) Spell(moonfire)
	Spell(sunfire)
}
AddIcon mastery=1 help=aoe
{
	if BuffPresent(solar_eclipse) and BuffPresent(natures_grace) Spell(hurricane)
	if BuffPresent(solar_eclipse) and ManaPercent() >25 Spell(hurricane)
	if BuffPresent(solar_eclipse) and ManaPercent() >25 Spell(hurricane)
}
AddIcon mastery=1 help=cd
{
	if not BuffPresent(starfall) Spell(starfall)
	if BuffPresent(celestial_alignment) Spell(berserking)
	if TalentPoints(incarnation_talent) and {BuffPresent(lunar_eclipse) or BuffPresent(solar_eclipse) } Spell(incarnation)
	if {not BuffPresent(lunar_eclipse) and not BuffPresent(solar_eclipse) } and {BuffPresent(chosen_of_elune) or not TalentPoints(incarnation_talent) or SpellCooldown(incarnation) >10 } Spell(celestial_alignment)
	if TalentPoints(natures_vigil_talent) and {{TalentPoints(incarnation_talent) and BuffPresent(chosen_of_elune) } or {not TalentPoints(incarnation_talent) and BuffPresent(celestial_alignment) } } Spell(natures_vigil)
}
AddIcon mastery=2 help=main
{
	if not InCombat() 
	{
		if not BuffPresent(str_agi_int any=1) Spell(mark_of_the_wild)
		if not BuffPresent(dream_of_cenarius_damage) and TalentPoints(dream_of_cenarius_talent) Spell(healing_touch)
		unless Stance(3) Spell(cat_form)
		Spell(savage_roar)
		if TalentPoints(force_of_nature_talent) Spell(treants)
	}
	
	if target.DebuffStacks(weakened_armor any=1) <3 if CheckBoxOn(faerie_fire_check) Spell(faerie_fire)
	if BuffExpires(savage_roar) Spell(savage_roar)
	if target.IsInterruptible() Spell(skull_bash_cat)
	if TalentPoints(dream_of_cenarius_talent) and BuffPresent(predatory_swiftness) and ComboPoints() >=4 and BuffStacks(dream_of_cenarius_damage) <2 Spell(healing_touch)
	if TalentPoints(dream_of_cenarius_talent) and BuffPresent(predatory_swiftness) and BuffRemains(predatory_swiftness) <=1 and BuffExpires(dream_of_cenarius_damage) Spell(healing_touch)
	if TalentPoints(dream_of_cenarius_talent) and PreviousSpell(natures_swiftness) Spell(healing_touch)
	if ComboPoints() >=1 and target.DebuffPresent(rip) and target.DebuffRemains(rip) <=2 and target.HealthPercent() <=25 Spell(ferocious_bite)
	if BuffRemains(savage_roar) <=1 or {BuffRemains(savage_roar) <=3 and ComboPoints() >0 } and target.HealthPercent() <25 Spell(savage_roar)
	if ComboPoints() >=5 and BuffPresent(virmens_bite) and BuffPresent(dream_of_cenarius_damage) and LastSpellDamageMultiplier(rip) <DamageMultiplier(rip) and target.HealthPercent() <=25 and target.DeadIn() >30 Spell(rip)
	if ComboPoints() >=5 and target.DebuffPresent(rip) and target.HealthPercent() <=25 Spell(ferocious_bite)
	if ComboPoints() >=5 and target.DeadIn() >=6 and target.DebuffRemains(rip) <2.0 and BuffPresent(dream_of_cenarius_damage) Spell(rip)
	if ComboPoints() >=5 and target.DeadIn() >=6 and target.DebuffRemains(rip) <6.0 and BuffPresent(dream_of_cenarius_damage) and LastSpellDamageMultiplier(rip) <=DamageMultiplier(rip) and target.HealthPercent() >25 Spell(rip)
	if BuffRemains(savage_roar) <=1 or {BuffRemains(savage_roar) <=3 and ComboPoints() >0 } Spell(savage_roar)
	if ComboPoints() >=5 and target.DeadIn() >=6 and target.DebuffRemains(rip) <2.0 and {BuffPresent(berserk) or target.DebuffRemains(rip) <=SpellCooldown(tigers_fury) } Spell(rip)
	if target.DebuffPresent(rip) and target.DebuffRemains(rip) <=4 Spell(ravage usable=1)
	if target.DebuffPresent(rip) and target.DebuffRemains(rip) <=4 Spell(shred)
	if {target.DeadIn() <=4 and ComboPoints() >=5 } or target.DeadIn() <=1 Spell(ferocious_bite)
	if BuffRemains(savage_roar) <=6 and ComboPoints() >=5 and {{{target.DebuffRemains(rip) +{8 -{target.TicksAdded(rip) *2 } } } >6 and {TalentPoints(soul_of_the_forest_talent) or BuffPresent(berserk) } } or {target.DebuffRemains(rip) +{8 -{target.TicksAdded(rip) *2 } } } >10 } and target.DebuffPresent(rip) Spell(savage_roar)
	if ComboPoints() >=5 and {target.DebuffRemains(rip) +{8 -{target.TicksAdded(rip) *2 } } } >6 and target.DebuffPresent(rip) and {TalentPoints(soul_of_the_forest_talent) or BuffPresent(berserk) } Spell(ferocious_bite)
	if ComboPoints() >=5 and {target.DebuffRemains(rip) +{8 -{target.TicksAdded(rip) *2 } } } >10 and target.DebuffPresent(rip) Spell(ferocious_bite)
	if target.DeadIn() >=8.5 and BuffPresent(dream_of_cenarius_damage) and {LastSpellDamageMultiplier(rake) <DamageMultiplier(rake) } Spell(rake)
	if target.DeadIn() >=8.5 and target.DebuffRemains(rake) <3.0 and {BuffPresent(berserk) or {SpellCooldown(tigers_fury) +0.8 } >=target.DebuffRemains(rake) } Spell(rake)
	if BuffStacks(omen_of_clarity) Spell(ravage usable=1)
	if BuffStacks(omen_of_clarity) Spell(shred)
	if BuffRemains(predatory_swiftness) >1 and not {Energy() +{EnergyRegen() *{BuffRemains(predatory_swiftness) -1 } } <{4 -ComboPoints() } *20 } Spell(ravage usable=1)
	if {{ComboPoints() <5 and target.DebuffRemains(rip) <3.0 } or {ComboPoints() ==0 and BuffRemains(savage_roar) <2 } } Spell(ravage usable=1)
	if target.DeadIn() <=8.5 Spell(ravage usable=1)
	if BuffRemains(predatory_swiftness) >1 and not {Energy() +{EnergyRegen() *{BuffRemains(predatory_swiftness) -1 } } <{4 -ComboPoints() } *20 } Spell(shred)
	if {{ComboPoints() <5 and target.DebuffRemains(rip) <3.0 } or {ComboPoints() ==0 and BuffRemains(savage_roar) <2 } } Spell(shred)
	if target.DeadIn() <=8.5 Spell(shred)
	if {BuffPresent(tigers_fury) or BuffPresent(berserk) } Spell(ravage usable=1)
	if SpellCooldown(tigers_fury) <=3.0 Spell(ravage usable=1)
	if TimeToMaxEnergy() <=1.0 Spell(ravage usable=1)
	if {BuffPresent(tigers_fury) or BuffPresent(berserk) } Spell(shred)
	if SpellCooldown(tigers_fury) <=3.0 Spell(shred)
	if TimeToMaxEnergy() <=1.0 Spell(shred)
	if TalentPoints(force_of_nature_talent) Spell(treants)

}
AddIcon mastery=2 help=offgcd
{
	
	if Energy() <=35 and not BuffStacks(omen_of_clarity) Spell(tigers_fury)
	if BuffStacks(omen_of_clarity) and target.DebuffRemains(thrash) <3 and BuffExpires(dream_of_cenarius_damage) Spell(thrash)
	if TalentPoints(natures_swiftness_talent) and TalentPoints(dream_of_cenarius_talent) and BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and ComboPoints() >=5 and target.HealthPercent() <=25 Spell(natures_swiftness)
	if TalentPoints(natures_swiftness_talent) and TalentPoints(dream_of_cenarius_talent) and BuffExpires(dream_of_cenarius_damage) and BuffExpires(predatory_swiftness) and ComboPoints() >=5 and target.DebuffRemains(rip) <3 and {BuffPresent(berserk) or target.DebuffRemains(rip) <=SpellCooldown(tigers_fury) } and target.HealthPercent() >25 Spell(natures_swiftness)
	if BuffStacks(omen_of_clarity) and target.DebuffRemains(thrash) <3 Spell(thrash)
	if ComboPoints() >=5 and target.DebuffRemains(thrash) <6 and {BuffPresent(tigers_fury) or BuffPresent(berserk) } Spell(thrash)
	if ComboPoints() >=5 and target.DebuffRemains(thrash) <6 and SpellCooldown(tigers_fury) <=3.0 Spell(thrash)
	if ComboPoints() >=5 and target.DebuffRemains(thrash) <6 and TimeToMaxEnergy() <=1.0 Spell(thrash)

}
AddIcon mastery=2 help=cd
{
	
	 { Item(Trinket0Slot usable=1) Item(Trinket1Slot usable=1) } 
	if BuffPresent(tigers_fury) or {target.DeadIn() <15 and SpellCooldown(tigers_fury) >6 } Spell(berserk)
	if BuffPresent(berserk) and TalentPoints(natures_vigil_talent) Spell(natures_vigil)
	if BuffPresent(berserk) and TalentPoints(incarnation_talent) Spell(incarnation)
	Spell(berserking)

}
]]