using UnityEngine;
using UnityEngine.UI;

/// <summary>Draws one exact circular slice for a UGUI pie chart.</summary>
public sealed class AreaPieSliceGraphic : Graphic
{
    private float startDegrees = 90f;
    private float sweepDegrees;

    public void SetSlice(float start, float sweep)
    {
        startDegrees = start;
        sweepDegrees = sweep;
        SetVerticesDirty();
    }

    protected override void OnPopulateMesh(VertexHelper vertexHelper)
    {
        vertexHelper.Clear();
        if (Mathf.Abs(sweepDegrees) < 0.01f)
        {
            return;
        }

        var rect = rectTransform.rect;
        var radius = Mathf.Min(rect.width, rect.height) * 0.5f;
        var center = rect.center;
        var segments = Mathf.Max(2, Mathf.CeilToInt(Mathf.Abs(sweepDegrees) / 4f));

        vertexHelper.AddVert(center, color, Vector2.zero);
        for (var i = 0; i <= segments; i++)
        {
            var degrees = startDegrees + sweepDegrees * i / segments;
            var radians = degrees * Mathf.Deg2Rad;
            var position = center + new Vector2(Mathf.Cos(radians), Mathf.Sin(radians)) * radius;
            vertexHelper.AddVert(position, color, Vector2.zero);
        }

        for (var i = 1; i <= segments; i++)
        {
            vertexHelper.AddTriangle(0, i, i + 1);
        }
    }
}
