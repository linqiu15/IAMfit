
# inverse of symmetric matrix
function inv2(a, b)
    detinv = 1 / (a[1, 1] * a[2, 2] - a[1, 2]^2)
    # Calculate the inverse of the matrix
    b[1, 1], b[2, 2], b[2, 1] = detinv * a[2, 2], detinv * a[1, 1], - detinv * a[2, 1]
    b[1, 2] = b[2, 1]
    return b
end
#inplace replacing a by its inverse
function inv2!(a)
    detinv = 1 / (a[1, 1] * a[2, 2] - a[1, 2] * a[2, 1])
    # Calculate the inverse of the matrix
    a[1, 1], a[2, 1], a[2, 2] = detinv * a[2, 2], - detinv * a[2, 1], detinv * a[1, 1]
    a[1, 2] = a[2, 1]
    return a
end

function inv3(a, b)
    detinv = 1 / (a[1, 1] * a[2, 2] * a[3, 3] + 2a[3, 1] * a[2, 1] * a[3, 2]
             - a[1, 1] * a[3, 2]^2 - a[2, 1]^2 * a[3, 3] - a[3, 1]^2 * a[2, 2])
    b[1, 1] = + detinv * (a[2, 2] * a[3, 3] - a[3, 2]^2)
    b[2, 1] = - detinv * (a[2, 1] * a[3, 3] - a[2, 3] * a[1, 3])
    b[3, 1] = + detinv * (a[2, 1] * a[3, 2] - a[2, 2] * a[3, 1])
    b[1, 2] = b[2, 1]
    b[2, 2] = + detinv * (a[1, 1] * a[3, 3] - a[1, 3]^2)
    b[3, 2] = - detinv * (a[1, 1] * a[3, 2] - a[2, 1] * a[3, 1])
    b[1, 3] = b[3, 1]
    b[2, 3] = b[3, 2]
    b[3, 3] = + detinv * (a[1, 1] * a[2, 2] - a[2, 1]^2)
    return b
end
function inv3!(a)
    detinv = 1 / (a[1, 1] * a[2, 2] * a[3, 3] + 2a[3, 1] * a[2, 1] * a[3, 2]
             - a[1, 1] * a[3, 2]^2 - a[2, 1]^2 * a[3, 3] - a[3, 1]^2 * a[2, 2])
    a[1, 1], a[2, 1], a[3, 1], a[2, 2], a[3, 2], a[3, 3] =
            (+ detinv * (a[2, 2] * a[3, 3] - a[3, 2]^2), - detinv * (a[2, 1] * a[3, 3] - a[2, 3] * a[1, 3]),
             + detinv * (a[2, 1] * a[3, 2] - a[2, 2] * a[3, 1]), + detinv * (a[1, 1] * a[3, 3] - a[1, 3]^2),
             - detinv * (a[1, 1] * a[3, 2] - a[2, 1] * a[3, 1]), + detinv * (a[1, 1] * a[2, 2] - a[2, 1]^2) )
    a[1, 2] = a[2, 1]
    a[1, 3] = a[3, 1]
    a[2, 3] = a[3, 2]
    return a
end
