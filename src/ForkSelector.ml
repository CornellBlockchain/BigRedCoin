let heavier_fork f1 f2 = 
  if (Fork.total_diff f1) > (Fork.total_diff f2) then f1 else f2

