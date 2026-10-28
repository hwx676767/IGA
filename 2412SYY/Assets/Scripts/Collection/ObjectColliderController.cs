using UnityEngine;
using UnityEngine.UI; // ���� UI ��
using System.Collections.Generic; // ���뼯�Ͽ⣬����ʹ�� List

public class ObjectColliderController : MonoBehaviour
{
    public GameObject collectionParent; // ������ Collection������ɸѡ����
    public List<string> objectNamesToSearch = new List<string>(); // ���������б�

    public Button triggerButton; // �����ť�������� Collider

    void Start()
    {
        // Ϊ��ť�󶨵���¼�
        triggerButton.onClick.AddListener(OnButtonClicked);
    }

    // ��ť����¼�
    void OnButtonClicked()
    {
        // ѭ����������ƥ�������
        foreach (string objectName in objectNamesToSearch)
        {
            EnableColliderByName(objectName);
        }
    }

    // ��������������������ƥ������� BoxCollider��������ָ������
    void EnableColliderByName(string objectName)
    {
        bool foundAny = false; // ���ڱ���Ƿ��ҵ�ƥ�������

        // ���������������������
        foreach (Transform child in collectionParent.transform)
        {
            // ��������������Ƿ�ƥ��
            if (child.name == objectName)
            {
                // ��鲢���� BoxCollider
                BoxCollider boxCollider = child.GetComponent<BoxCollider>();
                if (boxCollider != null)
                {
                    boxCollider.enabled = true;
                    Debug.Log("BoxCollider ������: " + child.name);
                    foundAny = true;

                    // ����������
                    child.gameObject.SetActive(true);
                    Debug.Log(child.name + " �Ѽ���");
                }
                else
                {
                    Debug.LogWarning("����û�� BoxCollider ���: " + child.name);
                }
            }
        }

        if (!foundAny)
        {
            Debug.LogWarning("û���ҵ���Ϊ " + objectName + " ������");
        }

    }

}
