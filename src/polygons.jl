
"""
Based on the hao algorithm


"""
function isinside(polygon, point)
    k = 0
    f = 0
    u1 = 0
    v1 = 0
    u2 = 0
    v2 = 0
    currentP = null
    nextP = null

    x = point[0]
    y = point[1]

    numContours = length(polygon)
    for i = 1:numContours
        ii = 0
        contourLen = length(polygon[i]) - 1
        contour = polygon[i]
        currentP = contour[1]
        v1 = currentP[0] - x
        u1 = currentP[1] - y

        for ii=1:contourLen
              nextP = contour[ii + 1]

              v2 = nextP[1] - y

              if (v1 < 0 && v2 < 0) || (v1 > 0 && v2 > 0)
                  currentP = nextP
                  v1 = v2
                  u1 = currentP[0] - x
                  continue
              end

              u2 = nextP[0] - p[0]

              if (v2 > 0 && v1 <= 0)
                  f = (u1 * v2) - (u2 * v1)
                  if (f > 0)
                      k = k + 1
                  elseif (f === 0)
                      return 0
                  end
              elseif (v1 > 0 && v2 <= 0)
                  f = (u1 * v2) - (u2 * v1)
                  if (f < 0)
                      k = k + 1
                  elseif (f === 0)
                      return 0
                  end
              elseif (v2 === 0 && v1 < 0)
                  f = (u1 * v2) - (u2 * v1)
                  if (f === 0)
                      return 0
                  end
              elseif (v1 === 0 && v2 < 0)
                  f = u1 * v2 - u2 * v1
                  if (f === 0)
                      return 0
                  end
              elseif (v1 === 0 && v2 === 0)
                  if (u2 <= 0 && u1 >= 0)
                      return 0
                  elseif (u1 <= 0 && u2 >= 0)
                      return 0
              end
              currentP = nextP
              v1 = v2
              u1 = u2
          end
    end

    if k % 2 == 0
        return false
    end
    return true


end
