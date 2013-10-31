local _, Ovale = ...
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "Ovale"
	local desc = "[5.2] Ovale: Shadow"
	local code = [[
Define(berserking 26297)
  SpellInfo(berserking duration=10 cd=180 )
  SpellAddBuff(berserking berserking=1)
Define(cascade 120785)
  SpellInfo(cascade duration=0.1 )
Define(devouring_plague 2944)
  SpellInfo(devouring_plague duration=6 tick=1 shadoworbs=1 haste=spell )
  SpellAddTargetDebuff(devouring_plague devouring_plague=1)
Define(dispersion 47585)
  SpellInfo(dispersion duration=6 cd=120 )
  SpellAddBuff(dispersion dispersion=1)
Define(divine_insight_shadow 124430)
  SpellInfo(divine_insight_shadow duration=12 )
  SpellAddBuff(divine_insight_shadow divine_insight_shadow=1)
Define(divine_star 110744)
  SpellInfo(divine_star cd=15 )
Define(halo 120517)
  SpellInfo(halo duration=5.5 cd=40 )
Define(inner_fire 588)
  SpellAddBuff(inner_fire inner_fire=1)
Define(inner_will 73413)
  SpellAddBuff(inner_will inner_will=1)
Define(mind_blast 8092)
  SpellInfo(mind_blast shadoworbs=-1 cd=8 test)
Define(mind_flay 15407)
  SpellInfo(mind_flay duration=3 canStopChannelling=1 )
  SpellAddTargetDebuff(mind_flay mind_flay=1)
Define(mind_flay_insanity 129197)
  SpellInfo(mind_flay_insanity duration=3 tick=1 haste=spell canStopChannelling=1 )
  SpellAddTargetDebuff(mind_flay_insanity mind_flay_insanity=1)
Define(mind_sear 48045)
  SpellInfo(mind_sear duration=5 canStopChannelling=1 )
  SpellAddBuff(mind_sear mind_sear=1)
Define(mind_spike 73510)
Define(mindbender 123040)
  SpellInfo(mindbender duration=15 cd=60 )
Define(power_infusion 10060)
  SpellInfo(power_infusion duration=20 cd=120 )
  SpellAddBuff(power_infusion power_infusion=1)
Define(power_word_fortitude 21562)
  SpellInfo(power_word_fortitude duration=3600 )
  SpellAddBuff(power_word_fortitude power_word_fortitude=1)
Define(shadow_word_death 32379)
  SpellInfo(shadow_word_death cd=8 )
Define(shadow_word_pain 589)
  SpellInfo(shadow_word_pain duration=18 tick=3 haste=spell )
  SpellAddTargetDebuff(shadow_word_pain shadow_word_pain=1)
Define(shadowfiend 34433)
  SpellInfo(shadowfiend duration=12 cd=180 )
Define(shadowform 15473)
  SpellAddBuff(shadowform shadowform=1)
Define(surge_of_darkness 87160)
  SpellInfo(surge_of_darkness duration=10 )
  SpellAddBuff(surge_of_darkness surge_of_darkness=1)
Define(vampiric_embrace 15286)
  SpellInfo(vampiric_embrace duration=15 cd=180 )
  SpellAddBuff(vampiric_embrace vampiric_embrace=1)
Define(vampiric_touch 34914)
  SpellInfo(vampiric_touch duration=15 tick=3 haste=spell )
  SpellAddTargetDebuff(vampiric_touch vampiric_touch=1)
Define(cascade_talent 16)
Define(divine_star_talent 17)
Define(halo_talent 18)
Define(mindbender_talent 8)
Define(power_infusion_talent 14)
AddCheckBox(showwait L(showwait) default)
AddIcon mastery=3 help=main
{
	if not InCombat() 
	{
		if not BuffPresent(stamina any=1) Spell(power_word_fortitude)
		if BuffExpires(inner_fire) and BuffExpires(inner_will) Spell(inner_fire)
		if BuffExpires(shadowform) Spell(shadowform)
	}
	if BuffExpires(shadowform) Spell(shadowform)
	if TalentPoints(mindbender_talent) Spell(mindbender)
	if ShadowOrbs() ==3 and {SpellCooldown(mind_blast) <1.5 or target.HealthPercent() <20 and SpellCooldown(shadow_word_death) <1.5 } Spell(devouring_plague)
	if target.HealthPercent(less 20) Spell(shadow_word_death)
	if SpellCooldown(mind_blast) Spell(mind_blast)
	if target.TicksRemain(devouring_plague) ==1 Spell(mind_flay_insanity)
	Spell(mind_flay_insanity)
	if not target.DebuffPresent(shadow_word_pain) Spell(shadow_word_pain)
	if target.DebuffRemains(vampiric_touch) <CastTime(vampiric_touch) Spell(vampiric_touch)
	if BuffStacks(surge_of_darkness) ==2 Spell(mind_spike)
	if target.TicksRemain(shadow_word_pain) <=1 Spell(shadow_word_pain)
	if target.DebuffRemains(vampiric_touch) <CastTime(vampiric_touch) +TickTime(vampiric_touch) Spell(vampiric_touch)
	if ShadowOrbs() ==3 and target.TicksRemain(devouring_plague) <=1 Spell(devouring_plague)
	if TalentPoints(halo_talent) Spell(halo)
	if TalentPoints(cascade_talent) Spell(cascade)
	if target.HealthPercent() <20 and SpellCooldown(shadow_word_death) <0.5 if CheckBoxOn(showwait) Texture(Spell_nature_timestop) 
	if SpellCooldown(mind_blast) <0.5 if CheckBoxOn(showwait) Texture(Spell_nature_timestop) 
	if BuffStacks(surge_of_darkness) Spell(mind_spike)
	Spell(mind_flay)
}
AddIcon mastery=3 help=offgcd
{
	if TalentPoints(divine_star_talent) Spell(divine_star)
}
AddIcon mastery=3 help=moving
{
	if target.HealthPercent(less 20) Spell(shadow_word_death)
	if BuffStacks(divine_insight_shadow) and SpellCooldown(mind_blast) Spell(mind_blast)
	Spell(shadow_word_pain)
}
AddIcon mastery=3 help=aoe
{
	Spell(mind_sear)
}
AddIcon mastery=3 help=cd
{
	 { Item(Trinket0Slot usable=1) Item(Trinket1Slot usable=1) } 
	if not TalentPoints(mindbender_talent) Spell(shadowfiend)
	if TalentPoints(power_infusion_talent) Spell(power_infusion)
	Spell(berserking)
	if ShadowOrbs() ==3 and Health() <=40 Spell(vampiric_embrace)
	Spell(dispersion)
}
]]

	OvaleScripts:RegisterScript("PRIEST", name, desc, code)
end
