using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkillController : MonoBehaviour
{
    public List<Skill> skills = new List<Skill>();
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    public void InitSkill()
    {
        for(int i=0;i<6;i++)
        {
            skills.Add(new Skill());
        }
        for (int i = 0; i < 3; i++)
        {
            skills[i].islocked = true;
        }
        for (int i = 3; i < 6; i++)
        {
            skills[i].islocked = false;
        }
    }
}
