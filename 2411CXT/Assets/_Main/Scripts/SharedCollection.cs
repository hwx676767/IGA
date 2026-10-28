using System.Collections;
using UnityEngine;
using UnityEngine.UI;

namespace SharedCollection
{
    public static class ColliderDerived
    {
        public static Vector3 GetColliderPivot(Collider2D targetCollider, PivotType targetPivot)
        {
            Bounds bound = targetCollider.bounds;
            Vector3 pos_Pivot = targetPivot switch
            {
                PivotType.UpperLeft => new Vector3(bound.center.x - bound.extents.x, bound.center.y + bound.extents.y, bound.center.z),
                PivotType.UpperCenter => new Vector3(bound.center.x, bound.center.y + bound.extents.y, bound.center.z),
                PivotType.UpperRight => new Vector3(bound.center.x + bound.extents.x, bound.center.y + bound.extents.y, bound.center.z),
                PivotType.MiddleLeft => new Vector3(bound.center.x - bound.extents.x, bound.center.y, bound.center.z),
                PivotType.MiddleCenter => bound.center,
                PivotType.MiddleRight => new Vector3(bound.center.x + bound.extents.x, bound.center.y, bound.center.z),
                PivotType.BottomLeft => new Vector3(bound.center.x - bound.extents.x, bound.center.y - bound.extents.y, bound.center.z),
                PivotType.BottomCenter => new Vector3(bound.center.x, bound.center.y - bound.extents.y, bound.center.z),
                PivotType.BottomRight => new Vector3(bound.center.x + bound.extents.x, bound.center.y - bound.extents.y, bound.center.z),
                _ => bound.center
            };
            return pos_Pivot;
        }
    }

    public static class UIDerived
    {
        public static Vector2 GetUIPivot(RectTransform targetRect, PivotType targetPivot)
        {
            Vector2 sizeDelta = targetRect.sizeDelta;
            Vector2 pos = targetRect.anchoredPosition;

            Vector2 pos_Pivot = targetPivot switch
            {
                PivotType.UpperLeft => new Vector2(pos.x - sizeDelta.x / 2, pos.y + sizeDelta.y / 2),
                PivotType.UpperCenter => new Vector2(pos.x, pos.y + sizeDelta.y / 2),
                PivotType.UpperRight => new Vector2(pos.x + sizeDelta.x / 2, pos.y + sizeDelta.y / 2),
                PivotType.MiddleLeft => new Vector2(pos.x - sizeDelta.x / 2, pos.y),
                PivotType.MiddleCenter => pos,
                PivotType.MiddleRight => new Vector2(pos.x + sizeDelta.x / 2, pos.y),
                PivotType.BottomLeft => new Vector2(pos.x - sizeDelta.x / 2, pos.y - sizeDelta.y / 2),
                PivotType.BottomCenter => new Vector2(pos.x, pos.y - sizeDelta.y / 2),
                PivotType.BottomRight => new Vector2(pos.x + sizeDelta.x / 2, pos.y - sizeDelta.y / 2),
                _ => pos
            };
            return pos_Pivot;
        }

        public static Rect RectTransToScreenPos(RectTransform rt, Camera cam)
        {
            Vector3[] corners = new Vector3[4];
            rt.GetWorldCorners(corners);
            Vector2 v0 = RectTransformUtility.WorldToScreenPoint(cam, corners[0]);
            Vector2 v1 = RectTransformUtility.WorldToScreenPoint(cam, corners[2]);
            Rect rect = new Rect(v0, v1 - v0);
            return rect;
        }
    }

    public static class TransformDerived
    {
        public static IEnumerator LerpLocalScale(Transform target, float targetValue, float duration)
        {
            float _timer = 0;
            float fromValue = target.localScale.x;

            while (_timer < duration)
            {
                _timer += Time.deltaTime;
                float tempValue = Mathf.Lerp(fromValue, targetValue, _timer / duration);
                target.localScale = new Vector3(tempValue, tempValue, tempValue);
                yield return null;
            }
        }
    }

    public static class MathDerived
    {
        public static float Lerp(float a, float b, float t)
        {
            return (1.0f - t) * a + b * t;
        }

        public static float InverseLerp(float a, float b, float v)
        {
            return (v - a) / (b - a);
        }

        public static float Remap(float iMin, float iMax, float oMin, float oMax, float v)
        {
            float t = InverseLerp(iMin, iMax, v);
            return Lerp(oMin, oMax, t);
        }
    }

    public enum PivotType { UpperLeft, UpperCenter, UpperRight, MiddleLeft, MiddleCenter, MiddleRight, BottomLeft, BottomCenter, BottomRight }
}