using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Animates leaf child objects of a tree prop. Existing children are used as
/// leaves; they fall once, rest, then fade out.
/// </summary>
public class S3FallingLeaves : MonoBehaviour
{
    private class Leaf
    {
        public RectTransform rect;
        public Graphic graphic;
        public Color graphicColor;
        public Vector2 rest;
        public Vector2 landed;
        public float restAngle;
        public float landedAngle;
        public float delay;
        public float duration;
        public float sway;
        public float spin;
        public float drop;
        public float clock;
        public float linger;
        public bool settled;
        public bool hidden;
    }

    private readonly List<Leaf> _leaves = new List<Leaf>();
    private bool _falling;
    private float _wind = 1f;

    public void BindFromHint(RectTransform hint)
    {
        CollectExistingLeaves();
        if (_leaves.Count == 0 && hint != null)
            CloneHintLeaves(hint);
        ResetLeaves();
        SetFalling(false);
    }

    public void SetFalling(bool falling)
    {
        if (_falling == falling) return;
        _falling = falling;
        if (!falling) ResetLeaves();
    }

    public void SetWind(float wind)
    {
        _wind = Mathf.Max(.2f, wind);
    }

    public void Burst()
    {
        _falling = true;
        _wind = 2.4f;
        for (int i = 0; i < _leaves.Count; i++)
        {
            if (_leaves[i].settled || _leaves[i].hidden) continue;
            _leaves[i].clock = Mathf.Max(_leaves[i].clock, _leaves[i].delay);
        }
    }

    private void Update()
    {
        bool onStage = transform.parent != null && transform.parent.name == "SideViewStage";
        for (int i = 0; i < _leaves.Count; i++)
        {
            Leaf leaf = _leaves[i];
            if (leaf.rect == null || leaf.graphic == null) continue;
            if (!onStage)
            {
                leaf.graphic.enabled = false;
                continue;
            }

            if (leaf.hidden)
            {
                leaf.graphic.enabled = false;
                continue;
            }

            leaf.graphic.enabled = true;
        }

        if (!_falling || !onStage || _leaves.Count == 0) return;

        for (int i = 0; i < _leaves.Count; i++)
        {
            Leaf leaf = _leaves[i];
            if (leaf.rect == null || leaf.hidden) continue;

            if (leaf.settled)
            {
                leaf.clock += Time.deltaTime;
                float fade = Mathf.Clamp01((leaf.clock - leaf.linger) / .8f);
                if (leaf.graphic != null)
                {
                    Color color = leaf.graphicColor;
                    color.a = leaf.graphicColor.a * (1f - fade);
                    leaf.graphic.color = color;
                }
                if (fade >= 1f)
                {
                    leaf.hidden = true;
                    if (leaf.graphic != null) leaf.graphic.enabled = false;
                }
                continue;
            }

            leaf.clock += Time.deltaTime * _wind;
            if (leaf.clock < leaf.delay)
            {
                leaf.rect.anchoredPosition = leaf.rest;
                leaf.rect.localRotation = Quaternion.Euler(0f, 0f, leaf.restAngle);
                continue;
            }

            float t = Mathf.Clamp01((leaf.clock - leaf.delay) / leaf.duration);
            float fall = t * t;
            float sway = Mathf.Sin(t * Mathf.PI * 3f + leaf.sway) * leaf.sway * (20f + 18f * _wind) * (1f - t);
            Vector2 position = leaf.rest + new Vector2(sway, -leaf.drop * fall);
            float angle = leaf.restAngle + t * leaf.spin;
            leaf.rect.anchoredPosition = position;
            leaf.rect.localRotation = Quaternion.Euler(0f, 0f, angle);

            if (t >= 1f)
            {
                leaf.settled = true;
                leaf.clock = 0f;
                leaf.landed = leaf.rest + new Vector2(0f, -leaf.drop);
                leaf.landedAngle = leaf.restAngle + leaf.spin;
                leaf.rect.anchoredPosition = leaf.landed;
                leaf.rect.localRotation = Quaternion.Euler(0f, 0f, leaf.landedAngle);
            }
        }
    }

    public void ResetLeaves()
    {
        for (int i = 0; i < _leaves.Count; i++)
        {
            Leaf leaf = _leaves[i];
            if (leaf.rect == null) continue;
            leaf.settled = false;
            leaf.hidden = false;
            leaf.rect.anchoredPosition = leaf.rest;
            leaf.rect.localRotation = Quaternion.Euler(0f, 0f, leaf.restAngle);
            leaf.clock = Random.Range(0f, leaf.delay * .35f);
            if (leaf.graphic != null)
            {
                leaf.graphic.color = leaf.graphicColor;
                leaf.graphic.enabled = false;
            }
        }
    }

    private void CollectExistingLeaves()
    {
        _leaves.Clear();
        for (int i = 0; i < transform.childCount; i++)
        {
            Transform child = transform.GetChild(i);
            if (child.GetComponent<Image>() == null) continue;
            Register(child.GetComponent<RectTransform>());
        }
    }

    private void CloneHintLeaves(RectTransform hint)
    {
        int index = 0;
        for (int i = 0; i < hint.childCount; i++)
        {
            Transform source = hint.GetChild(i);
            if (source.GetComponent<Image>() == null) continue;

            GameObject clone = Instantiate(source.gameObject, transform);
            clone.name = "叶_" + (++index);
            RectTransform rect = clone.GetComponent<RectTransform>();
            Graphic graphic = clone.GetComponent<Graphic>();
            if (graphic != null)
            {
                graphic.raycastTarget = false;
                graphic.enabled = false;
            }
            Register(rect);
        }
    }

    private void Register(RectTransform rect)
    {
        if (rect == null) return;
        float restAngle = rect.localEulerAngles.z;
        if (restAngle > 180f) restAngle -= 360f;
        float drop = Random.Range(150f, 240f);
        Graphic graphic = rect.GetComponent<Graphic>();
        _leaves.Add(new Leaf
        {
            rect = rect,
            graphic = graphic,
            graphicColor = graphic != null ? graphic.color : Color.white,
            rest = rect.anchoredPosition,
            landed = rect.anchoredPosition + new Vector2(0f, -drop),
            restAngle = restAngle,
            landedAngle = restAngle,
            delay = Random.Range(.15f, 1.4f),
            duration = Random.Range(2.6f, 4.4f),
            sway = Random.Range(.7f, 1.4f),
            spin = Random.Range(-140f, 140f),
            drop = drop,
            linger = Random.Range(1.4f, 2.6f),
            clock = 0f
        });
    }
}
