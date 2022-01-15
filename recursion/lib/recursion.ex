defmodule Recursion do
  @moduledoc	"""
  Módulo para treino com funções recursivas, baseado no módulo Enum.
  """

  @doc	"""
  Executa uma função para cada item da lista.
  """
  def each([head|tail], func) do
    func.(head)
    each(tail, func)
  end

  def each([], _func) do :ok end

  @doc	"""
  Retorna uma nova lista com os itens modificados pela função passada.
  """
  def map([ head | tail ], func) do
    [func.(head) | map(tail, func)]
  end

  def map([], _func) do [] end

  @doc	"""
  Reduz os valores da lista passada, acumulando-os e retornandoo valor acumulado.
  """
  def reduce([head|tail], acc, func) do
    acc = func.(head, acc)
    reduce(tail, acc, func)
  end

  def reduce([], acc, _func) do acc end


  @doc	"""
  Retorna os valores da lista que satisfazem a condição da função passada.
  """
  def filter([head|tail], func) do
    cond do
      func.(head) -> [head | filter(tail, func)]
      true -> filter(tail, func)
    end
  end

  def filter([], _func) do [] end
end
