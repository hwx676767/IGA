using System.Collections.Generic;
using UnityEngine;

namespace RTSBuildingSystem
{
    public class GameManager : MonoBehaviour
    {
        public static GameManager instance;

        [Header("Building Management")]
        public List<PlacementObject> buildings = new List<PlacementObject>();

        private void Awake()
        {
            if (instance == null)
                instance = this;
            else
                Destroy(gameObject);
        }

        // 如果以后需要添加其他全局管理功能，可以在这里扩展
        // 目前只保留建筑列表的管理
    }
}